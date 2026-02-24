// Keyword-to-image mapping for locksmith instructional images
// Images are served from Supabase Storage bucket "instructional-images"

const STORAGE_BASE =
  'https://eptnkprttskodgnfeasg.supabase.co/storage/v1/object/public/instructional-images';

export interface InstructionalImage {
  url: string;
  caption: string;
  category: string;
}

interface KeywordMapping {
  keywords: RegExp;
  image: InstructionalImage;
}

// Mapping of locksmith terms to instructional images
// These will match against the AI assistant's response text
const KEYWORD_MAPPINGS: KeywordMapping[] = [
  // === LOCK TYPES ===
  {
    keywords: /\b(deadbolt|dead bolt|dead-bolt)\b/i,
    image: {
      url: `${STORAGE_BASE}/locks/deadbolt.jpg`,
      caption: 'Deadbolt Lock',
      category: 'Lock Types',
    },
  },
  {
    keywords: /\b(knob lock|door knob lock)\b/i,
    image: {
      url: `${STORAGE_BASE}/locks/knob-lock.jpg`,
      caption: 'Knob Lock',
      category: 'Lock Types',
    },
  },
  {
    keywords: /\b(padlock|pad lock)\b/i,
    image: {
      url: `${STORAGE_BASE}/locks/padlock.jpg`,
      caption: 'Padlock',
      category: 'Lock Types',
    },
  },
  {
    keywords: /\b(disc detainer|disk detainer)\b/i,
    image: {
      url: `${STORAGE_BASE}/locks/disc-detainer.jpg`,
      caption: 'Disc Detainer Lock',
      category: 'Lock Types',
    },
  },
  {
    keywords: /\b(mortise lock|mortise)\b/i,
    image: {
      url: `${STORAGE_BASE}/locks/mortise.jpg`,
      caption: 'Mortise Lock',
      category: 'Lock Types',
    },
  },
  {
    keywords: /\b(lever (handle )?lock)\b/i,
    image: {
      url: `${STORAGE_BASE}/locks/lever-lock.jpg`,
      caption: 'Lever Handle Lock',
      category: 'Lock Types',
    },
  },
  {
    keywords: /\b(smart lock|smart-lock|electronic lock)\b/i,
    image: {
      url: `${STORAGE_BASE}/locks/smart-lock.jpg`,
      caption: 'Smart/Electronic Lock',
      category: 'Lock Types',
    },
  },
  {
    keywords: /\b(kwikset smartkey|smart ?key)\b/i,
    image: {
      url: `${STORAGE_BASE}/locks/kwikset-smartkey.jpg`,
      caption: 'Kwikset SmartKey System',
      category: 'Lock Types',
    },
  },

  // === TOOLS ===
  {
    keywords: /\blishi\b(?!.*\btool\b)|lishi (pick|tool|decoder|2.in" ?1)/i,
    image: {
      url: `${STORAGE_BASE}/tools/lishi-pick.jpg`,
      caption: 'Lishi 2-in-1 Pick/Decoder',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(tension wrench|tension tool|tensioner)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/tension-wrench.jpg`,
      caption: 'Tension Wrench',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(hook pick|single pin pick|spp)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/hook-pick.jpg`,
      caption: 'Hook Pick (SPP)',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(rake|raking)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/rake-pick.jpg`,
      caption: 'Rake Pick',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(air wedge|air bag|airbag tool)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/air-wedge.jpg`,
      caption: 'Air Wedge Tool',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(slim jim|slim-jim)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/slim-jim.jpg`,
      caption: 'Slim Jim',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(plug spinner)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/plug-spinner.jpg`,
      caption: 'Plug Spinner',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(key extractor|broken key extractor)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/key-extractor.jpg`,
      caption: 'Broken Key Extractor',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(disc detainer pick)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/disc-detainer-pick.jpg`,
      caption: 'Disc Detainer Pick',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(decoder|key decoder)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/decoder.jpg`,
      caption: 'Key Decoder',
      category: 'Tools',
    },
  },
  {
    keywords: /\b(pinning kit|repin kit)\b/i,
    image: {
      url: `${STORAGE_BASE}/tools/pinning-kit.jpg`,
      caption: 'Pinning Kit',
      category: 'Tools',
    },
  },

  // === KEY MACHINES ===
  {
    keywords: /\b(sec.?e9|sec.?e ?9)\b/i,
    image: {
      url: `${STORAGE_BASE}/machines/sec-e9.jpg`,
      caption: 'SEC-E9 Key Cutting Machine',
      category: 'Key Machines',
    },
  },
  {
    keywords: /\b(condor|xhorse condor)\b/i,
    image: {
      url: `${STORAGE_BASE}/machines/condor.jpg`,
      caption: 'Xhorse Condor Key Cutting Machine',
      category: 'Key Machines',
    },
  },
  {
    keywords: /\b(autel|im608|im508)\b/i,
    image: {
      url: `${STORAGE_BASE}/machines/autel-im608.jpg`,
      caption: 'Autel IM608 Programmer',
      category: 'Key Machines',
    },
  },
  {
    keywords: /\b(smart pro|smart ?pro)\b/i,
    image: {
      url: `${STORAGE_BASE}/machines/smart-pro.jpg`,
      caption: 'Advanced Diagnostics Smart Pro',
      category: 'Key Machines',
    },
  },
  {
    keywords: /\b(vvdi|xhorse vvdi|vvdi key tool)\b/i,
    image: {
      url: `${STORAGE_BASE}/machines/vvdi.jpg`,
      caption: 'Xhorse VVDI Key Tool',
      category: 'Key Machines',
    },
  },

  // === TECHNIQUES ===
  {
    keywords: /\b(single pin pick|spp|picking technique)\b/i,
    image: {
      url: `${STORAGE_BASE}/techniques/spp.jpg`,
      caption: 'Single Pin Picking (SPP) Technique',
      category: 'Techniques',
    },
  },
  {
    keywords: /\b(bump(ing)? key|bump attack)\b/i,
    image: {
      url: `${STORAGE_BASE}/techniques/bump-key.jpg`,
      caption: 'Bump Key Technique',
      category: 'Techniques',
    },
  },
  {
    keywords: /\b(shim(ming)?|padlock shim)\b/i,
    image: {
      url: `${STORAGE_BASE}/techniques/shimming.jpg`,
      caption: 'Lock Shimming Technique',
      category: 'Techniques',
    },
  },
  {
    keywords: /\b(bypass|bypass tool|bypass method)\b/i,
    image: {
      url: `${STORAGE_BASE}/techniques/bypass.jpg`,
      caption: 'Lock Bypass Technique',
      category: 'Techniques',
    },
  },
  {
    keywords: /\b(rekey|re-key|repin)\b/i,
    image: {
      url: `${STORAGE_BASE}/techniques/rekey.jpg`,
      caption: 'Rekeying Procedure',
      category: 'Techniques',
    },
  },
  {
    keywords: /\b(obd|obd.?ii?|on.?board diagnostic)\b/i,
    image: {
      url: `${STORAGE_BASE}/techniques/obd-programming.jpg`,
      caption: 'OBD Key Programming',
      category: 'Techniques',
    },
  },
  {
    keywords: /\b(eeprom|soldering|chip read)\b/i,
    image: {
      url: `${STORAGE_BASE}/techniques/eeprom.jpg`,
      caption: 'EEPROM / Chip Soldering',
      category: 'Techniques',
    },
  },
  {
    keywords: /\b(transponder|transponder (clone|program|chip))\b/i,
    image: {
      url: `${STORAGE_BASE}/techniques/transponder-programming.jpg`,
      caption: 'Transponder Programming',
      category: 'Techniques',
    },
  },

  // === KEY TYPES ===
  {
    keywords: /\b(smart key|proximity key|prox key|push.?to.?start)\b/i,
    image: {
      url: `${STORAGE_BASE}/keys/smart-key-fob.jpg`,
      caption: 'Smart Key / Proximity Fob',
      category: 'Key Types',
    },
  },
  {
    keywords: /\b(flip key|switchblade key)\b/i,
    image: {
      url: `${STORAGE_BASE}/keys/flip-key.jpg`,
      caption: 'Flip / Switchblade Key',
      category: 'Key Types',
    },
  },
  {
    keywords: /\b(transponder key|chip key)\b/i,
    image: {
      url: `${STORAGE_BASE}/keys/transponder-key.jpg`,
      caption: 'Transponder / Chip Key',
      category: 'Key Types',
    },
  },
  {
    keywords: /\b(remote head key|remote key)\b/i,
    image: {
      url: `${STORAGE_BASE}/keys/remote-head-key.jpg`,
      caption: 'Remote Head Key',
      category: 'Key Types',
    },
  },
  {
    keywords: /\b(emergency (key|blade)|insert key|mechanical key)\b/i,
    image: {
      url: `${STORAGE_BASE}/keys/emergency-blade.jpg`,
      caption: 'Emergency Key Blade',
      category: 'Key Types',
    },
  },
];

/**
 * Scan assistant response text and return matching instructional images.
 * Deduplicates by URL so the same image isn't shown twice.
 * Returns max 4 images to avoid cluttering the chat.
 */
export function findInstructionalImages(
  responseText: string
): InstructionalImage[] {
  const seen = new Set<string>();
  const results: InstructionalImage[] = [];

  for (const mapping of KEYWORD_MAPPINGS) {
    if (mapping.keywords.test(responseText)) {
      if (!seen.has(mapping.image.url)) {
        seen.add(mapping.image.url);
        results.push(mapping.image);
      }
    }
    if (results.length >= 4) break;
  }

  return results;
}
