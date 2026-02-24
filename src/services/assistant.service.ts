import { supabase } from '../lib/supabase';
import type { AutomotiveKey, ResidentialLock } from '../types/database';

export interface ChatMessage {
  role: 'user' | 'assistant';
  content: string;
  timestamp: string;
}

export interface Conversation {
  id: string;
  user_id: string;
  title: string;
  messages: ChatMessage[];
  created_at: string;
  updated_at: string;
}

// Locksmith system prompt for Claude
const SYSTEM_PROMPT = `You are an expert automotive and residential locksmith assistant integrated into the LockBase app. You help locksmiths on the job with step-by-step guidance.

When given a job or vehicle/lock query:
1. Identify the exact vehicle year/make/model or lock brand/model
2. Use the provided database records for accurate specs
3. Provide a clear step-by-step guide including:

FOR AUTOMOTIVE JOBS:
- Key blank needed (e.g., HON66, TOY43)
- Lishi tool for picking/decoding (e.g., Lishi HON66)
- Transponder type and chip (e.g., Hitag Pro, 47 chip)
- Remote frequency (e.g., 315 MHz, 433 MHz)
- FCC ID for the remote
- Emergency key blank
- Battery type for the fob
- Whether OBD programming works or if EEPROM/soldering is needed
- Which programmer to use (Autel IM608, Smart Pro, VVDI, etc.)
- Step-by-step programming instructions
- Whether PIN code is required
- Whether all keys must be present
- Estimated job time and suggested pricing range

FOR RESIDENTIAL JOBS:
- Lock brand and model details
- Keyway type (e.g., SC1, KW1, C123)
- Number of pins and security pin types
- Recommended pick tools and techniques
- Bypass methods if applicable
- Rekey procedures and pinning specs
- Key blank number
- ANSI grade and security rating

Always be practical and job-focused. Use industry terminology that locksmiths understand. If the database doesn't have specific info, supplement with your knowledge but note what's from the database vs general knowledge.

Format your responses clearly with headers and bullet points. Keep it concise but thorough - locksmiths are busy on the job.`;

// Search the database for relevant vehicle/lock info
async function searchDatabase(query: string) {
  const searchTerms = query.toLowerCase();

  // Try automotive search
  const { data: autoKeys } = await supabase
    .from('automotive_keys')
    .select('*')
    .or(
      `model_name.ilike.%${searchTerms}%,key_blank.ilike.%${searchTerms}%,fcc_id.ilike.%${searchTerms}%`
    )
    .limit(10) as { data: AutomotiveKey[] | null };

  // Try residential search
  const { data: locks } = await supabase
    .from('residential_locks')
    .select('*, manufacturers(name)')
    .or(`name.ilike.%${searchTerms}%,keyway.ilike.%${searchTerms}%`)
    .limit(10) as { data: (ResidentialLock & { manufacturers: { name: string } | null })[] | null };

  // Also try parsing year/make/model patterns
  const yearMatch = searchTerms.match(/(\d{4})\s+(\w+)\s+(.+)/);
  let yearSpecificKeys: AutomotiveKey[] = [];
  if (yearMatch) {
    const [, year, make, model] = yearMatch;
    const yearNum = parseInt(year);
    const { data } = await supabase
      .from('automotive_keys')
      .select('*')
      .ilike('model_name', `%${make}%${model}%`)
      .lte('year_start', yearNum)
      .gte('year_end', yearNum)
      .limit(5) as { data: AutomotiveKey[] | null };
    if (data) yearSpecificKeys = data;
  }

  return {
    autoKeys: autoKeys || [],
    yearSpecificKeys,
    locks: locks || [],
  };
}

// Format database records for the AI context
function formatDatabaseContext(dbResults: Awaited<ReturnType<typeof searchDatabase>>): string {
  const parts: string[] = [];

  const allAutoKeys = [
    ...dbResults.yearSpecificKeys,
    ...dbResults.autoKeys.filter(
      (k) => !dbResults.yearSpecificKeys.find((yk: any) => yk.id === k.id)
    ),
  ];

  if (allAutoKeys.length > 0) {
    parts.push('=== DATABASE RECORDS: AUTOMOTIVE KEYS ===');
    for (const key of allAutoKeys) {
      parts.push(`
Vehicle: ${key.model_name} (${key.year_start}-${key.year_end})
Key Blank: ${key.key_blank}
Key Type: ${key.key_type}
Transponder: ${key.transponder_type || 'N/A'}
Chip: ${key.chip_type || 'N/A'}
Frequency: ${key.remote_frequency || 'N/A'}
FCC ID: ${key.fcc_id || 'N/A'}
IC Number: ${key.ic_number || 'N/A'}
Emergency Blank: ${key.emergency_key_blank || 'N/A'}
Battery: ${key.battery_type || 'N/A'}
Buttons: ${key.buttons || 'N/A'}
Lishi Tool: ${key.lishi_tool || 'N/A'}
Test Key: ${key.test_key_blank || 'N/A'}
OBD Programmable: ${key.obd_programmable ? 'Yes' : 'No'}
PIN Required: ${key.pin_code_required ? 'Yes' : 'No'}
Programming Notes: ${key.programming_notes || 'N/A'}
---`);
    }
  }

  if (dbResults.locks.length > 0) {
    parts.push('\n=== DATABASE RECORDS: RESIDENTIAL LOCKS ===');
    for (const lock of dbResults.locks) {
      const mfrName = (lock as any).manufacturers?.name || 'Unknown';
      parts.push(`
Lock: ${mfrName} ${lock.name}
Type: ${lock.lock_type}
Keyway: ${lock.keyway}
Pins: ${lock.num_pins}
Security Pins: ${lock.security_pins || 'None'}
ANSI Grade: ${lock.ansi_grade || 'N/A'}
Bump Resistant: ${lock.bump_resistant ? 'Yes' : 'No'}
Pick Resistant: ${lock.pick_resistant ? 'Yes' : 'No'}
Drill Resistant: ${lock.drill_resistant ? 'Yes' : 'No'}
Smart Features: ${lock.smart_features || 'None'}
---`);
    }
  }

  return parts.join('\n');
}

// Quick lookup - just get specs without AI
export async function quickLookup(query: string) {
  const results = await searchDatabase(query);
  return {
    autoKeys: [
      ...results.yearSpecificKeys,
      ...results.autoKeys.filter(
        (k) => !results.yearSpecificKeys.find((yk: any) => yk.id === k.id)
      ),
    ],
    locks: results.locks,
  };
}

// Send a message to the AI assistant
export async function sendAssistantMessage(
  userMessage: string,
  conversationHistory: ChatMessage[],
  apiKey: string
): Promise<string> {
  // Search database for relevant context
  const dbResults = await searchDatabase(userMessage);
  const dbContext = formatDatabaseContext(dbResults);

  // Build messages for Claude
  const messages = conversationHistory.map((msg) => ({
    role: msg.role as 'user' | 'assistant',
    content: msg.content,
  }));

  // Add database context to the current message
  let enrichedMessage = userMessage;
  if (dbContext.trim()) {
    enrichedMessage = `${userMessage}\n\n[The following data was found in our database for this query:]\n${dbContext}`;
  }

  messages.push({ role: 'user', content: enrichedMessage });

  try {
    const response = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
        'anthropic-dangerous-direct-browser-access': 'true',
      },
      body: JSON.stringify({
        model: 'claude-sonnet-4-20250514',
        max_tokens: 2048,
        system: SYSTEM_PROMPT,
        messages,
      }),
    });

    if (!response.ok) {
      const errText = await response.text();
      throw new Error(`API error ${response.status}: ${errText}`);
    }

    const data = await response.json();
    const assistantReply =
      data.content?.[0]?.text || 'Sorry, I could not generate a response.';
    return assistantReply;
  } catch (error: any) {
    throw new Error(`Assistant error: ${error.message}`);
  }
}

// Conversation CRUD
export const conversationService = {
  async getConversations(userId: string) {
    const { data, error } = await supabase
      .from('conversation_history')
      .select('id, title, updated_at, created_at')
      .eq('user_id', userId)
      .order('updated_at', { ascending: false })
      .limit(50);
    if (error) throw error;
    return data;
  },

  async getConversation(id: string) {
    const { data, error } = await supabase
      .from('conversation_history')
      .select('*')
      .eq('id', id)
      .single();
    if (error) throw error;
    return data as Conversation;
  },

  async createConversation(userId: string, title: string, messages: ChatMessage[]) {
    const { data, error } = await supabase
      .from('conversation_history')
      .insert({
        user_id: userId,
        title,
        messages: JSON.parse(JSON.stringify(messages)),
      } as any)
      .select()
      .single();
    if (error) throw error;
    return data as unknown as Conversation;
  },

  async updateConversation(id: string, messages: ChatMessage[], title?: string) {
    const update: Record<string, unknown> = {
      messages: JSON.parse(JSON.stringify(messages)),
      updated_at: new Date().toISOString(),
    };
    if (title) update.title = title;

    const { error } = await supabase
      .from('conversation_history')
      .update(update as any)
      .eq('id', id);
    if (error) throw error;
  },

  async deleteConversation(id: string) {
    const { error } = await supabase
      .from('conversation_history')
      .delete()
      .eq('id', id);
    if (error) throw error;
  },
};
