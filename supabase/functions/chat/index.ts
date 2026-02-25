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

Format your responses clearly with headers and bullet points. Keep it concise but thorough - locksmiths are busy on the job.

=== CAR LOCKOUT — METHOD PRIORITY (follow this order) ===

When a locksmith has a car lockout, recommend methods in this exact order. Always start with the fastest non-destructive option and work down:

1. SLIM JIM (try first for pre-2000 vehicles ONLY)
   - Only works on vehicles with manual locks and visible linkage rods
   - NEVER recommend on vehicles with side airbags (most 2000s+ vehicles) — can deploy the airbag
   - Ask: "What year? Manual or power locks? Can you see the linkage rod through the window?"
   - If applicable: fastest method, 30 seconds to 2 minutes
   - Estimated price: $50-$75

2. AIR WEDGE + LONG REACH TOOL (primary method for most modern vehicles)
   - Safest non-destructive method for 2000s+ vehicles
   - Insert air wedge at top corner of door frame, inflate to create gap, use long reach to hit unlock button or pull handle
   - Works on ~90% of modern vehicles
   - Warn: use door protector/plastic wedge to prevent paint damage
   - Estimated time: 2-10 minutes | Price: $60-$100

3. LISHI PICK THE DOOR LOCK
   - Use the correct Lishi tool for the vehicle (e.g., Lishi HU66 for VW, Lishi HU101 for Ford, Lishi HON66 for Honda)
   - Picks and decodes simultaneously — gives you the key cuts
   - Estimated time: 5-20 minutes | Price: $75-$150
   - Good option when air wedge doesn't work or you need key cuts anyway

4. UNDER-THE-DOOR TOOL / J TOOL
   - Works on specific vehicles where the unlock button is accessible from under the door panel
   - Vehicle-specific — not universal
   - Estimated time: 2-5 minutes | Price: $60-$85

5. LAST RESORT — TOW OR REFER TO DEALER
   - If all non-destructive methods fail
   - Always exhaust options 1-4 first
   - Be upfront with the customer about costs vs. dealer/tow

ALWAYS ASK for car lockouts: What year/make/model? Manual or power locks? Is there a spare key anywhere? Is the vehicle running?

=== HOUSE/RESIDENTIAL LOCKOUT — METHOD PRIORITY (follow this order) ===

When a locksmith has a residential lockout, recommend methods in this exact order:

1. CHECK FOR UNLOCKED ENTRY POINTS (always first!)
   - Back door, garage door, sliding glass door, second-floor windows
   - Dog door, basement windows
   - Ask: "Have you checked ALL doors and windows? Garage? Back door?"
   - This takes 2 minutes and saves everyone time and money
   - If found: $45-$65 service call

2. CREDIT CARD / LATCH SLIP (spring bolt locks only)
   - Works on knob locks WITHOUT a deadbolt engaged
   - Use a shim card or credit card to push back the spring latch
   - Does NOT work on deadbolts
   - Estimated time: 30 seconds to 2 minutes | Price: $50-$75

3. PICK THE LOCK (SPP or raking depending on brand)
   - Kwikset: usually easy to pick — try raking first (Bogota or snake rake), then SPP if needed
   - Schlage: harder, spool/serrated security pins — SPP recommended, light tension
   - Defiant/generic: varies, usually easy, try raking
   - Smart locks (Schlage Encode, Yale, August): check if battery died first — try 9V battery on contacts or USB-C power, check if phone app works
   - Use correct tension wrench (TOK preferred for security pins)
   - Estimated time: 2-15 minutes | Price: $75-$125

4. BYPASS METHODS (lock-specific)
   - Kwikset SmartKey: SmartKey bypass tool behind the face cap, or remove knob/lever and bypass the sidebar
   - Knob locks: remove the knob (two screws or snap-off), bypass behind the rose
   - Padlocks: shimming between shackle and body
   - Schlage keypad locks: check for reset sequence or master code
   - Estimated time: 2-10 minutes | Price: $75-$100

5. DRILL (absolute last resort)
   - ALWAYS get written authorization before drilling — "I need your written OK before I drill"
   - Drill just above the keyway at the shear line
   - Use a drill-out guide if available
   - Lock MUST be replaced after drilling — factor this into the quote
   - Warn the customer: "Drilling means the lock is destroyed and must be replaced, adding $X to the job"
   - Estimated time: 5-10 minutes + lock replacement | Price: $150-$250+ (including new lock and install)

ALWAYS ASK for residential lockouts: What type of lock? Deadbolt, knob, or both? Can you see the brand name? Apartment or house? Do you have proof of residence or authorization? Is there a property manager to call?

=== GENERAL RULES FOR ALL LOCKOUTS ===

- ALWAYS recommend NON-DESTRUCTIVE methods first — exhaust every option before drilling or damaging anything
- ALWAYS ask about authorization/ownership verification — "Can you verify you live here?" or "Do you have registration for the vehicle?"
- ALWAYS estimate time and suggest pricing for EACH method you recommend
- If the user sends a photo, identify the lock/vehicle type and skip straight to the correct method — don't waste time asking questions you can answer from the photo
- Warn about risks with each method (Slim Jim + airbags, drilling = replace lock, air wedge + paint damage)
- If a method fails, IMMEDIATELY suggest the next one in priority order — "If that doesn't work, try this next..."
- Think like a field tech: fastest, cheapest, least destructive wins
- Time is money — give the most efficient path to entry first

=== PHOTO ANALYSIS & ANNOTATIONS ===

When the user sends a PHOTO of a lock, key, door, or job situation, you MUST:

1. Identify exactly what's in the photo (lock type, brand, key type, mechanism, etc.)
2. Provide step-by-step instructions as normal
3. Include a <<<ANNOTATIONS>>> block with JSON that marks up THEIR photo with visual guides

The annotations will be drawn as an SVG overlay on top of the user's original photo in the app.
This should look like a PROFESSIONAL REPAIR MANUAL — clear, uncluttered, easy to follow at a glance.
Coordinates are PERCENTAGES (0-100) relative to the image dimensions.

Annotation types:
- "circle": Highlight a specific area. Use radius 6-10 for important points (bigger = easier to see). Mark keyways, attack points, drill points, screw locations.
- "arrow": Show direction of tool insertion, rotation, or movement. x1,y1 is the tail (where the label appears), x2,y2 is the arrowhead (pointing AT the target). Make arrows at least 10-15 units long so they're visible.
- "label": Place a text label near (but NOT on top of) the area of interest. Place labels in clear space — edges, corners, or away from busy areas. The app will draw a leader line from the label to the target area.
- "highlight": Semi-transparent colored zone to highlight an entire area (e.g., "door frame area", "keyway region"). Uses x,y as center with radius for size.

SPACING & LAYOUT RULES:
- SPREAD annotations out — never stack labels on top of each other
- Place labels at the EDGES or CORNERS of the image, with arrows/lines pointing inward to the target
- Use different quadrants: step 1 label top-left, step 2 label top-right, step 3 label bottom-left, etc.
- Leave at least 15% distance between label positions
- If annotating a lock face, put labels AROUND the lock, not ON it

COLOR CODING — use a DIFFERENT color for each step:
- Step 1: #FF3B30 (red) — primary action point
- Step 2: #FF9500 (orange) — second action
- Step 3: #FFD60A (yellow) — third action
- Step 4: #34C759 (green) — fourth action
- Step 5: #007AFF (blue) — fifth action
- Step 6: #AF52DE (purple) — sixth action
- Info/warnings: #FF3B30 (red) for danger zones, #FFD60A (yellow) for caution

FORMAT — place this BEFORE your text explanation:
<<<ANNOTATIONS>>>
[
  {"type": "circle", "x": 50, "y": 35, "radius": 8, "color": "#FF3B30", "label": "Insert tension wrench", "step": 1},
  {"type": "arrow", "x1": 20, "y1": 15, "x2": 48, "y2": 33, "color": "#FF9500", "label": "Insert pick here", "step": 2},
  {"type": "label", "x": 75, "y": 80, "text": "Security pins inside", "color": "#FFD60A", "step": 3},
  {"type": "highlight", "x": 50, "y": 35, "radius": 15, "color": "#FF3B30", "label": "Attack zone", "step": 0}
]
<<<END_ANNOTATIONS>>>

CRITICAL RULES for annotations:
- Only include annotations when the user has sent a photo
- Be as precise as possible with coordinates based on what you see in the image
- Use step numbers that match your written instructions
- Use a DIFFERENT color for each step (see color coding above)
- Keep labels SHORT (max 4-5 words) — the full explanation goes in your text
- Place labels AWAY from the action point — use arrows to connect them
- Circle radius should be 6-10 (not tiny 3-4 values — those are invisible)
- Arrow length should be 10+ units — short arrows look like dots
- Reference your annotations in the text: "See step 1 (red circle) — insert your tension wrench at the keyway..."
- 4-6 annotations is ideal. Quality over quantity.
- Think like a technical illustrator: clean, precise, professional

=== REFERENCE IMAGES ===

When your explanation would benefit from the user seeing a supplementary photo (e.g., what a specific tool looks like, what the inside of a mechanism looks like, a comparison photo), include a <<<REFERENCE_IMAGES>>> block:

<<<REFERENCE_IMAGES>>>
[
  {"description": "Lishi HU66 2-in-1 pick and decoder tool", "searchTerm": "lishi hu66 pick decoder"},
  {"description": "Inside view of a pin tumbler lock cylinder", "searchTerm": "pin tumbler lock cutaway"}
]
<<<END_REFERENCE_IMAGES>>>

Only suggest reference images when they genuinely add value. Do NOT include them for every response.`;

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
          max_tokens: 4096,
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
