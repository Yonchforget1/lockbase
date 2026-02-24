import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { corsHeaders } from "../_shared/cors.ts";

const ANTHROPIC_API_KEY = Deno.env.get("ANTHROPIC_API_KEY")!;
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

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

interface ChatMessage {
  role: "user" | "assistant";
  content: string;
  timestamp: string;
}

interface ImageData {
  base64: string;
  mimeType: string;
}

interface RequestBody {
  message: string;
  conversationHistory: ChatMessage[];
  images?: ImageData[];
}

// Search the database for relevant vehicle/lock info
async function searchDatabase(supabase: any, query: string) {
  const searchTerms = query.toLowerCase();

  // Try automotive search
  const { data: autoKeys } = await supabase
    .from("automotive_keys")
    .select("*")
    .or(
      `model_name.ilike.%${searchTerms}%,key_blank.ilike.%${searchTerms}%,fcc_id.ilike.%${searchTerms}%`
    )
    .limit(10);

  // Try residential search
  const { data: locks } = await supabase
    .from("residential_locks")
    .select("*, manufacturers(name)")
    .or(`name.ilike.%${searchTerms}%,keyway.ilike.%${searchTerms}%`)
    .limit(10);

  // Also try parsing year/make/model patterns
  const yearMatch = searchTerms.match(/(\d{4})\s+(\w+)\s+(.+)/);
  let yearSpecificKeys: any[] = [];
  if (yearMatch) {
    const [, year, make, model] = yearMatch;
    const yearNum = parseInt(year);
    const { data } = await supabase
      .from("automotive_keys")
      .select("*")
      .ilike("model_name", `%${make}%${model}%`)
      .lte("year_start", yearNum)
      .gte("year_end", yearNum)
      .limit(5);
    if (data) yearSpecificKeys = data;
  }

  return {
    autoKeys: autoKeys || [],
    yearSpecificKeys,
    locks: locks || [],
  };
}

// Format database records for the AI context
function formatDatabaseContext(dbResults: any): string {
  const parts: string[] = [];

  const allAutoKeys = [
    ...dbResults.yearSpecificKeys,
    ...dbResults.autoKeys.filter(
      (k: any) => !dbResults.yearSpecificKeys.find((yk: any) => yk.id === k.id)
    ),
  ];

  if (allAutoKeys.length > 0) {
    parts.push("=== DATABASE RECORDS: AUTOMOTIVE KEYS ===");
    for (const key of allAutoKeys) {
      parts.push(`
Vehicle: ${key.model_name} (${key.year_start}-${key.year_end})
Key Blank: ${key.key_blank}
Key Type: ${key.key_type}
Transponder: ${key.transponder_type || "N/A"}
Chip: ${key.chip_type || "N/A"}
Frequency: ${key.remote_frequency || "N/A"}
FCC ID: ${key.fcc_id || "N/A"}
IC Number: ${key.ic_number || "N/A"}
Emergency Blank: ${key.emergency_key_blank || "N/A"}
Battery: ${key.battery_type || "N/A"}
Buttons: ${key.buttons || "N/A"}
Lishi Tool: ${key.lishi_tool || "N/A"}
Test Key: ${key.test_key_blank || "N/A"}
OBD Programmable: ${key.obd_programmable ? "Yes" : "No"}
PIN Required: ${key.pin_code_required ? "Yes" : "No"}
Programming Notes: ${key.programming_notes || "N/A"}
---`);
    }
  }

  if (dbResults.locks.length > 0) {
    parts.push("\n=== DATABASE RECORDS: RESIDENTIAL LOCKS ===");
    for (const lock of dbResults.locks) {
      const mfrName = lock.manufacturers?.name || "Unknown";
      parts.push(`
Lock: ${mfrName} ${lock.name}
Type: ${lock.lock_type}
Keyway: ${lock.keyway}
Pins: ${lock.num_pins}
Security Pins: ${lock.security_pins || "None"}
ANSI Grade: ${lock.ansi_grade || "N/A"}
Bump Resistant: ${lock.bump_resistant ? "Yes" : "No"}
Pick Resistant: ${lock.pick_resistant ? "Yes" : "No"}
Drill Resistant: ${lock.drill_resistant ? "Yes" : "No"}
Smart Features: ${lock.smart_features || "None"}
---`);
    }
  }

  return parts.join("\n");
}

Deno.serve(async (req: Request) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    // Parse request body
    const { message, conversationHistory, images }: RequestBody =
      await req.json();

    if (!message || typeof message !== "string") {
      return new Response(
        JSON.stringify({ error: "Missing or invalid 'message' field" }),
        {
          status: 400,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    // Create Supabase client with service role for DB access
    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

    // Database search for relevant context
    const dbResults = await searchDatabase(supabase, message);
    const dbContext = formatDatabaseContext(dbResults);

    // Build messages array for Claude
    const messages: Array<{
      role: "user" | "assistant";
      content: string | Array<Record<string, unknown>>;
    }> = (conversationHistory || []).map((msg) => ({
      role: msg.role as "user" | "assistant",
      content: msg.content,
    }));

    let enrichedMessage = message;
    if (dbContext.trim()) {
      enrichedMessage = `${message}\n\n[The following data was found in our database for this query:]\n${dbContext}`;
    }

    // If images are provided, build a multi-part content block for vision
    if (images && images.length > 0) {
      const contentParts: Array<Record<string, unknown>> = [];

      // Add each image as an image content block
      for (const img of images) {
        contentParts.push({
          type: "image",
          source: {
            type: "base64",
            media_type: img.mimeType || "image/jpeg",
            data: img.base64,
          },
        });
      }

      // Add the text message after the images
      contentParts.push({
        type: "text",
        text: enrichedMessage,
      });

      messages.push({ role: "user", content: contentParts });
    } else {
      messages.push({ role: "user", content: enrichedMessage });
    }

    // Call Anthropic API
    const anthropicResponse = await fetch(
      "https://api.anthropic.com/v1/messages",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "x-api-key": ANTHROPIC_API_KEY,
          "anthropic-version": "2023-06-01",
        },
        body: JSON.stringify({
          model: "claude-sonnet-4-20250514",
          max_tokens: 2048,
          system: SYSTEM_PROMPT,
          messages,
        }),
      }
    );

    if (!anthropicResponse.ok) {
      const errText = await anthropicResponse.text();
      console.error("Anthropic API error:", anthropicResponse.status, errText);
      return new Response(
        JSON.stringify({
          error: `AI service error (${anthropicResponse.status})`,
        }),
        {
          status: 502,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    const data = await anthropicResponse.json();
    const reply =
      data.content?.[0]?.text || "Sorry, I could not generate a response.";

    return new Response(JSON.stringify({ reply }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Edge function error:", error);
    return new Response(
      JSON.stringify({ error: "Internal server error" }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
