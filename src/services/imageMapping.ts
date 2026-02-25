// Annotation parsing for AI assistant responses
// Parses structured annotation data and reference images from Claude's response

// ─── Types ──────────────────────────────────────────────────────────

export interface AnnotationCircle {
  type: 'circle';
  x: number;       // percentage 0-100
  y: number;       // percentage 0-100
  radius: number;  // percentage of image width (typically 3-8)
  color: string;
  label: string;
  step?: number;
}

export interface AnnotationArrow {
  type: 'arrow';
  x1: number;      // start x percentage
  y1: number;      // start y percentage
  x2: number;      // end x percentage (arrowhead)
  y2: number;      // end y percentage (arrowhead)
  color: string;
  label?: string;
  step?: number;
}

export interface AnnotationLabel {
  type: 'label';
  x: number;       // percentage 0-100
  y: number;       // percentage 0-100
  text: string;
  color: string;
  step?: number;
}

export interface AnnotationHighlight {
  type: 'highlight';
  x: number;       // center x percentage 0-100
  y: number;       // center y percentage 0-100
  radius: number;  // percentage of image width
  color: string;
  label?: string;
  step?: number;
}

export type Annotation = AnnotationCircle | AnnotationArrow | AnnotationLabel | AnnotationHighlight;

export interface ReferenceImage {
  description: string;
  searchTerm: string;
}

export interface ParsedResponse {
  text: string;                       // Clean display text
  annotations: Annotation[];         // Overlay annotations for user's photo
  referenceImages: ReferenceImage[];  // Supplementary reference image suggestions
}

// ─── Parsing ────────────────────────────────────────────────────────

const ANNOTATIONS_REGEX = /<<<ANNOTATIONS>>>([\s\S]*?)<<<END_ANNOTATIONS>>>/;
const REFERENCES_REGEX = /<<<REFERENCE_IMAGES>>>([\s\S]*?)<<<END_REFERENCE_IMAGES>>>/;

/**
 * Parse Claude's response to extract annotations and reference images.
 * Returns clean text for display plus structured overlay data.
 */
export function parseAssistantResponse(rawResponse: string): ParsedResponse {
  let text = rawResponse;
  let annotations: Annotation[] = [];
  let referenceImages: ReferenceImage[] = [];

  // Extract annotations block
  const annotMatch = text.match(ANNOTATIONS_REGEX);
  if (annotMatch) {
    text = text.replace(ANNOTATIONS_REGEX, '').trim();
    try {
      const parsed = JSON.parse(annotMatch[1].trim());
      if (Array.isArray(parsed)) {
        annotations = parsed.filter(isValidAnnotation);
      }
    } catch {
      // If JSON parsing fails, skip annotations silently
    }
  }

  // Extract reference images block
  const refMatch = text.match(REFERENCES_REGEX);
  if (refMatch) {
    text = text.replace(REFERENCES_REGEX, '').trim();
    try {
      const parsed = JSON.parse(refMatch[1].trim());
      if (Array.isArray(parsed)) {
        referenceImages = parsed.filter(
          (r: any) => r && typeof r.description === 'string' && typeof r.searchTerm === 'string'
        );
      }
    } catch {
      // If JSON parsing fails, skip references silently
    }
  }

  // Clean up any extra whitespace from block removal
  text = text.replace(/\n{3,}/g, '\n\n').trim();

  return { text, annotations, referenceImages };
}

// ─── Validation ─────────────────────────────────────────────────────

function isValidAnnotation(a: any): a is Annotation {
  if (!a || typeof a !== 'object') return false;

  switch (a.type) {
    case 'circle':
      return (
        typeof a.x === 'number' && typeof a.y === 'number' &&
        typeof a.radius === 'number' && typeof a.label === 'string' &&
        a.x >= 0 && a.x <= 100 && a.y >= 0 && a.y <= 100
      );
    case 'arrow':
      return (
        typeof a.x1 === 'number' && typeof a.y1 === 'number' &&
        typeof a.x2 === 'number' && typeof a.y2 === 'number' &&
        a.x1 >= 0 && a.x1 <= 100 && a.y1 >= 0 && a.y1 <= 100 &&
        a.x2 >= 0 && a.x2 <= 100 && a.y2 >= 0 && a.y2 <= 100
      );
    case 'label':
      return (
        typeof a.x === 'number' && typeof a.y === 'number' &&
        typeof a.text === 'string' &&
        a.x >= 0 && a.x <= 100 && a.y >= 0 && a.y <= 100
      );
    case 'highlight':
      return (
        typeof a.x === 'number' && typeof a.y === 'number' &&
        typeof a.radius === 'number' &&
        a.x >= 0 && a.x <= 100 && a.y >= 0 && a.y <= 100
      );
    default:
      return false;
  }
}
