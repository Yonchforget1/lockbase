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

const EDGE_FUNCTION_URL =
  'https://eptnkprttskodgnfeasg.supabase.co/functions/v1/chat';

// Quick lookup - just get specs without AI (stays client-side)
export async function quickLookup(query: string) {
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

  const allAutoKeys = [
    ...yearSpecificKeys,
    ...(autoKeys || []).filter(
      (k) => !yearSpecificKeys.find((yk: any) => yk.id === k.id)
    ),
  ];

  return {
    autoKeys: allAutoKeys,
    locks: locks || [],
  };
}

// Send a message to the AI assistant via Edge Function
export async function sendAssistantMessage(
  userMessage: string,
  conversationHistory: ChatMessage[]
): Promise<string> {
  // Use session token if logged in, otherwise use anon key
  const {
    data: { session },
  } = await supabase.auth.getSession();
  const token =
    session?.access_token ||
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVwdG5rcHJ0dHNrb2RnbmZlYXNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4OTk0OTEsImV4cCI6MjA4NzQ3NTQ5MX0.hvBkzBs139gRyaJL2zQkdtUzUdk9GYZH0wnCYR0F0ms';

  try {
    const response = await fetch(EDGE_FUNCTION_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify({
        message: userMessage,
        conversationHistory,
      }),
    });

    if (!response.ok) {
      const errData = await response
        .json()
        .catch(() => ({ error: 'Unknown error' }));
      throw new Error(errData.error || `Server error ${response.status}`);
    }

    const data = await response.json();
    return data.reply;
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
