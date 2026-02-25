import React, { useState, useRef, useCallback } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  FlatList,
  StyleSheet,
  KeyboardAvoidingView,
  Platform,
  ActivityIndicator,
  Alert,
  ScrollView,
  Modal,
  Dimensions,
  Pressable,
  LayoutChangeEvent,
} from 'react-native';
import { Image } from 'expo-image';
import { SafeAreaView } from 'react-native-safe-area-context';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import * as ImagePicker from 'expo-image-picker';
import Svg, { Circle, Line, Polygon, G, ForeignObject } from 'react-native-svg';
import { colors } from '../../../src/lib/theme';
import { useAssistantStore } from '../../../src/stores/assistantStore';
import {
  sendAssistantMessage,
  quickLookup,
  conversationService,
  type ChatMessage,
  type ImageAttachment,
} from '../../../src/services/assistant.service';
import {
  parseAssistantResponse,
  type Annotation,
  type ReferenceImage,
} from '../../../src/services/imageMapping';
import { useAuth } from '../../../src/hooks/useAuth';

const { width: SCREEN_WIDTH } = Dimensions.get('window');
const IMAGE_THUMB_SIZE = 160;
const ANNOTATED_IMAGE_WIDTH = SCREEN_WIDTH * 0.72; // fits inside bubble

// ─── Annotated Image Component ────────────────────────────────────
// Renders the user's original photo with SVG annotation overlays
function AnnotatedImage({
  imageUri,
  annotations,
  onPress,
}: {
  imageUri: string;
  annotations: Annotation[];
  onPress?: () => void;
}) {
  const [imgSize, setImgSize] = useState({ width: ANNOTATED_IMAGE_WIDTH, height: ANNOTATED_IMAGE_WIDTH * 0.75 });

  const onLayout = useCallback((e: LayoutChangeEvent) => {
    const { width } = e.nativeEvent.layout;
    // Maintain 4:3 aspect ratio as default
    setImgSize({ width, height: width * 0.75 });
  }, []);

  const w = imgSize.width;
  const h = imgSize.height;

  return (
    <TouchableOpacity
      activeOpacity={0.9}
      onPress={onPress}
      style={styles.annotatedContainer}
      onLayout={onLayout}
    >
      {/* User's original photo */}
      <Image
        source={{ uri: imageUri }}
        style={{ width: w, height: h, borderRadius: 10 }}
        contentFit="cover"
        transition={200}
      />

      {/* SVG Overlay */}
      <Svg
        width={w}
        height={h}
        style={StyleSheet.absoluteFill}
        viewBox={`0 0 ${w} ${h}`}
      >
        {annotations.map((ann, idx) => {
          switch (ann.type) {
            case 'circle':
              return (
                <AnnotationCircleSvg
                  key={idx}
                  ann={ann}
                  w={w}
                  h={h}
                />
              );
            case 'arrow':
              return (
                <AnnotationArrowSvg
                  key={idx}
                  ann={ann}
                  w={w}
                  h={h}
                />
              );
            case 'label':
              return (
                <AnnotationLabelSvg
                  key={idx}
                  ann={ann}
                  w={w}
                  h={h}
                />
              );
            default:
              return null;
          }
        })}
      </Svg>

      {/* "ANNOTATED" badge */}
      <View style={styles.annotatedBadge}>
        <MaterialCommunityIcons name="draw" size={10} color={colors.textPrimary} />
        <Text style={styles.annotatedBadgeText}>ANNOTATED</Text>
      </View>
    </TouchableOpacity>
  );
}

function AnnotationCircleSvg({ ann, w, h }: { ann: any; w: number; h: number }) {
  const cx = (ann.x / 100) * w;
  const cy = (ann.y / 100) * h;
  const r = (ann.radius / 100) * w;
  const color = ann.color || '#FF3B30';

  return (
    <G>
      <Circle cx={cx} cy={cy} r={r} stroke={color} strokeWidth={2.5} fill="none" />
      {ann.step != null && (
        <>
          <Circle cx={cx - r - 8} cy={cy - r - 8} r={10} fill={color} />
          <ForeignObject x={cx - r - 18} y={cy - r - 18} width={20} height={20}>
            <View style={{ width: 20, height: 20, alignItems: 'center', justifyContent: 'center' }}>
              <Text style={{ color: '#fff', fontSize: 11, fontWeight: '800' }}>{ann.step}</Text>
            </View>
          </ForeignObject>
        </>
      )}
    </G>
  );
}

function AnnotationArrowSvg({ ann, w, h }: { ann: any; w: number; h: number }) {
  const x1 = (ann.x1 / 100) * w;
  const y1 = (ann.y1 / 100) * h;
  const x2 = (ann.x2 / 100) * w;
  const y2 = (ann.y2 / 100) * h;
  const color = ann.color || '#FF3B30';

  // Arrowhead calculation
  const angle = Math.atan2(y2 - y1, x2 - x1);
  const headLen = 10;
  const p1x = x2 - headLen * Math.cos(angle - Math.PI / 6);
  const p1y = y2 - headLen * Math.sin(angle - Math.PI / 6);
  const p2x = x2 - headLen * Math.cos(angle + Math.PI / 6);
  const p2y = y2 - headLen * Math.sin(angle + Math.PI / 6);

  return (
    <G>
      <Line x1={x1} y1={y1} x2={x2} y2={y2} stroke={color} strokeWidth={2.5} />
      <Polygon points={`${x2},${y2} ${p1x},${p1y} ${p2x},${p2y}`} fill={color} />
      {ann.step != null && (
        <>
          <Circle cx={x1} cy={y1} r={10} fill={color} />
          <ForeignObject x={x1 - 10} y={y1 - 10} width={20} height={20}>
            <View style={{ width: 20, height: 20, alignItems: 'center', justifyContent: 'center' }}>
              <Text style={{ color: '#fff', fontSize: 11, fontWeight: '800' }}>{ann.step}</Text>
            </View>
          </ForeignObject>
        </>
      )}
    </G>
  );
}

function AnnotationLabelSvg({ ann, w, h }: { ann: any; w: number; h: number }) {
  const x = (ann.x / 100) * w;
  const y = (ann.y / 100) * h;
  const color = ann.color || '#FFD60A';
  const labelWidth = Math.min(ann.text.length * 7 + 16, w * 0.6);
  const labelHeight = 22;

  return (
    <G>
      <ForeignObject
        x={Math.min(x, w - labelWidth - 4)}
        y={Math.min(y, h - labelHeight - 4)}
        width={labelWidth}
        height={labelHeight}
      >
        <View style={{
          backgroundColor: color,
          borderRadius: 4,
          paddingHorizontal: 6,
          paddingVertical: 2,
          flexDirection: 'row',
          alignItems: 'center',
          gap: 4,
        }}>
          {ann.step != null && (
            <View style={{
              width: 16, height: 16, borderRadius: 8,
              backgroundColor: 'rgba(0,0,0,0.5)',
              alignItems: 'center', justifyContent: 'center',
            }}>
              <Text style={{ color: '#fff', fontSize: 9, fontWeight: '800' }}>{ann.step}</Text>
            </View>
          )}
          <Text
            style={{ color: '#000', fontSize: 10, fontWeight: '700' }}
            numberOfLines={1}
          >
            {ann.text}
          </Text>
        </View>
      </ForeignObject>
    </G>
  );
}

// ─── Annotation Legend (below the annotated image) ────────────────
function AnnotationLegend({ annotations }: { annotations: Annotation[] }) {
  const numbered = annotations
    .filter((a) => a.step != null)
    .sort((a, b) => (a.step || 0) - (b.step || 0));
  if (!numbered.length) return null;

  return (
    <View style={styles.legendContainer}>
      {numbered.map((ann, idx) => {
        const label =
          ann.type === 'circle' ? ann.label :
          ann.type === 'arrow' ? (ann.label || '') :
          ann.type === 'label' ? ann.text : '';
        if (!label) return null;
        return (
          <View key={idx} style={styles.legendRow}>
            <View style={[styles.legendDot, { backgroundColor: ann.color || '#FF3B30' }]}>
              <Text style={styles.legendDotText}>{ann.step}</Text>
            </View>
            <Text style={styles.legendLabel}>{label}</Text>
          </View>
        );
      })}
    </View>
  );
}

// ─── Reference Image Card ─────────────────────────────────────────
// Shows supplementary reference image suggestions (text-only, no broken images)
function ReferenceImageCards({ refs }: { refs: ReferenceImage[] }) {
  if (!refs.length) return null;
  return (
    <View style={styles.refContainer}>
      <View style={styles.refHeader}>
        <MaterialCommunityIcons name="image-search" size={14} color={colors.accentSecondary} />
        <Text style={styles.refHeaderText}>REFERENCE IMAGES</Text>
      </View>
      {refs.map((ref, idx) => (
        <View key={idx} style={styles.refCard}>
          <MaterialCommunityIcons name="image-outline" size={20} color={colors.accentSecondary} />
          <View style={styles.refCardText}>
            <Text style={styles.refDescription}>{ref.description}</Text>
            <Text style={styles.refSearch}>Search: "{ref.searchTerm}"</Text>
          </View>
        </View>
      ))}
    </View>
  );
}

// ─── Image Zoom Modal ─────────────────────────────────────────────
function ImageZoomModal({
  visible,
  imageUri,
  caption,
  annotations,
  onClose,
}: {
  visible: boolean;
  imageUri: string | null;
  caption?: string;
  annotations?: Annotation[];
  onClose: () => void;
}) {
  if (!imageUri) return null;
  const zoomW = SCREEN_WIDTH - 32;
  const zoomH = zoomW * 0.75;

  return (
    <Modal
      visible={visible}
      transparent
      animationType="fade"
      onRequestClose={onClose}
      statusBarTranslucent
    >
      <Pressable style={styles.zoomOverlay} onPress={onClose}>
        <View style={styles.zoomHeader}>
          <TouchableOpacity style={styles.zoomCloseBtn} onPress={onClose}>
            <MaterialCommunityIcons name="close" size={24} color={colors.textPrimary} />
          </TouchableOpacity>
        </View>

        <View>
          <Image
            source={{ uri: imageUri }}
            style={{ width: zoomW, height: zoomH, borderRadius: 8 }}
            contentFit="contain"
            transition={200}
          />
          {annotations && annotations.length > 0 && (
            <Svg
              width={zoomW}
              height={zoomH}
              style={StyleSheet.absoluteFill}
              viewBox={`0 0 ${zoomW} ${zoomH}`}
            >
              {annotations.map((ann, idx) => {
                switch (ann.type) {
                  case 'circle':
                    return <AnnotationCircleSvg key={idx} ann={ann} w={zoomW} h={zoomH} />;
                  case 'arrow':
                    return <AnnotationArrowSvg key={idx} ann={ann} w={zoomW} h={zoomH} />;
                  case 'label':
                    return <AnnotationLabelSvg key={idx} ann={ann} w={zoomW} h={zoomH} />;
                  default:
                    return null;
                }
              })}
            </Svg>
          )}
        </View>

        {caption ? (
          <View style={styles.zoomCaptionBar}>
            <Text style={styles.zoomCaption}>{caption}</Text>
          </View>
        ) : null}
      </Pressable>
    </Modal>
  );
}

// ─── Inline Image Grid (for user-sent images) ────────────────────
function ImageThumbnails({
  images,
  onPress,
}: {
  images: ImageAttachment[];
  onPress: (uri: string) => void;
}) {
  if (!images.length) return null;
  return (
    <View style={styles.imageGrid}>
      {images.map((img, idx) => (
        <TouchableOpacity
          key={idx}
          activeOpacity={0.8}
          onPress={() => onPress(img.uri)}
        >
          <Image
            source={{ uri: img.uri }}
            style={styles.bubbleImage}
            contentFit="cover"
            transition={200}
          />
        </TouchableOpacity>
      ))}
    </View>
  );
}

// ─── Message Bubble ───────────────────────────────────────────────
function MessageBubble({
  message,
  onImagePress,
}: {
  message: ChatMessage;
  onImagePress: (uri: string, caption?: string, annotations?: Annotation[]) => void;
}) {
  const isUser = message.role === 'user';

  // Parse assistant responses for annotations
  const parsed = !isUser ? parseAssistantResponse(message.content) : null;
  const displayText = parsed ? parsed.text : message.content;
  const annotations = parsed?.annotations || [];
  const referenceImages = parsed?.referenceImages || [];
  const hasAnnotations = annotations.length > 0 && message.sourceImageUri;

  return (
    <View style={[styles.bubbleRow, isUser && styles.bubbleRowUser]}>
      {!isUser && (
        <View style={styles.avatarBot}>
          <MaterialCommunityIcons name="robot" size={18} color={colors.accentPrimary} />
        </View>
      )}
      <View style={[
        styles.bubble,
        isUser ? styles.bubbleUser : styles.bubbleBot,
        hasAnnotations && styles.bubbleBotWide,
      ]}>
        {/* User-attached images */}
        {isUser && message.images && message.images.length > 0 && (
          <ImageThumbnails
            images={message.images}
            onPress={(uri) => onImagePress(uri)}
          />
        )}

        {/* Annotated photo (assistant response with annotations on user's photo) */}
        {hasAnnotations && (
          <>
            <AnnotatedImage
              imageUri={message.sourceImageUri!}
              annotations={annotations}
              onPress={() => onImagePress(message.sourceImageUri!, 'Annotated Photo', annotations)}
            />
            <AnnotationLegend annotations={annotations} />
          </>
        )}

        {/* Text content */}
        <Text style={[styles.bubbleText, isUser && styles.bubbleTextUser]}>
          {displayText}
        </Text>

        {/* Reference images (text-only cards, no broken images) */}
        {!isUser && referenceImages.length > 0 && (
          <ReferenceImageCards refs={referenceImages} />
        )}

        <Text style={styles.bubbleTime}>
          {new Date(message.timestamp).toLocaleTimeString([], {
            hour: '2-digit',
            minute: '2-digit',
          })}
        </Text>
      </View>
      {isUser && (
        <View style={styles.avatarUser}>
          <MaterialCommunityIcons name="account" size={18} color={colors.bgPrimary} />
        </View>
      )}
    </View>
  );
}

// ─── Image Preview Strip (attached before sending) ────────────────
function AttachedImagesPreview({
  images,
  onRemove,
}: {
  images: ImageAttachment[];
  onRemove: (index: number) => void;
}) {
  if (!images.length) return null;
  return (
    <View style={styles.attachedPreview}>
      <ScrollView horizontal showsHorizontalScrollIndicator={false}>
        {images.map((img, idx) => (
          <View key={idx} style={styles.attachedThumb}>
            <Image
              source={{ uri: img.uri }}
              style={styles.attachedImage}
              contentFit="cover"
              transition={150}
            />
            <TouchableOpacity
              style={styles.attachedRemove}
              onPress={() => onRemove(idx)}
            >
              <MaterialCommunityIcons name="close-circle" size={20} color={colors.error} />
            </TouchableOpacity>
          </View>
        ))}
      </ScrollView>
    </View>
  );
}

// ─── Quick Lookup ─────────────────────────────────────────────────
function QuickLookupResult({ data }: { data: any }) {
  if (!data) return null;

  return (
    <ScrollView style={styles.lookupResults} showsVerticalScrollIndicator={false}>
      {data.autoKeys?.length > 0 && (
        <>
          <Text style={styles.lookupHeader}>Automotive Key Specs</Text>
          {data.autoKeys.map((key: any, idx: number) => (
            <View key={idx} style={styles.specCard}>
              <Text style={styles.specTitle}>{key.model_name}</Text>
              <Text style={styles.specSubtitle}>
                {key.year_start}-{key.year_end}
              </Text>
              <View style={styles.specGrid}>
                <SpecRow label="Key Blank" value={key.key_blank} />
                <SpecRow label="Key Type" value={key.key_type} />
                <SpecRow label="Transponder" value={key.transponder_type} />
                <SpecRow label="Chip" value={key.chip_type} />
                <SpecRow label="Frequency" value={key.remote_frequency} />
                <SpecRow label="FCC ID" value={key.fcc_id} />
                <SpecRow label="Lishi Tool" value={key.lishi_tool} icon="wrench" />
                <SpecRow label="Emergency Blank" value={key.emergency_key_blank} />
                <SpecRow label="Battery" value={key.battery_type} />
                <SpecRow label="Buttons" value={key.buttons} />
                <SpecRow label="OBD Prog." value={key.obd_programmable ? 'Yes' : 'No'} />
                <SpecRow label="PIN Required" value={key.pin_code_required ? 'Yes' : 'No'} />
              </View>
              {key.programming_notes && (
                <View style={styles.notesBox}>
                  <Text style={styles.notesLabel}>Programming Notes</Text>
                  <Text style={styles.notesText}>{key.programming_notes}</Text>
                </View>
              )}
            </View>
          ))}
        </>
      )}

      {data.locks?.length > 0 && (
        <>
          <Text style={styles.lookupHeader}>Residential Lock Specs</Text>
          {data.locks.map((lock: any, idx: number) => (
            <View key={idx} style={styles.specCard}>
              <Text style={styles.specTitle}>
                {(lock as any).manufacturers?.name} {lock.name}
              </Text>
              <View style={styles.specGrid}>
                <SpecRow label="Type" value={lock.lock_type} />
                <SpecRow label="Keyway" value={lock.keyway} />
                <SpecRow label="Pins" value={String(lock.num_pins)} />
                <SpecRow label="Security Pins" value={lock.security_pins} />
                <SpecRow label="ANSI Grade" value={lock.ansi_grade} />
                <SpecRow label="Bump Resistant" value={lock.bump_resistant ? 'Yes' : 'No'} />
                <SpecRow label="Pick Resistant" value={lock.pick_resistant ? 'Yes' : 'No'} />
              </View>
            </View>
          ))}
        </>
      )}

      {!data.autoKeys?.length && !data.locks?.length && (
        <View style={styles.emptyLookup}>
          <MaterialCommunityIcons name="magnify-close" size={48} color={colors.textTertiary} />
          <Text style={styles.emptyText}>No results found. Try a different search.</Text>
        </View>
      )}
    </ScrollView>
  );
}

function SpecRow({
  label,
  value,
  icon,
}: {
  label: string;
  value?: string | null;
  icon?: string;
}) {
  if (!value || value === 'N/A') return null;
  return (
    <View style={styles.specRow}>
      <Text style={styles.specLabel}>{label}</Text>
      <View style={{ flexDirection: 'row', alignItems: 'center', gap: 4, flex: 1 }}>
        {icon && (
          <MaterialCommunityIcons
            name={icon as any}
            size={14}
            color={colors.accentPrimary}
          />
        )}
        <Text style={styles.specValue}>{value}</Text>
      </View>
    </View>
  );
}

const SUGGESTIONS = [
  '2019 Honda Civic, lost all keys',
  '2022 Toyota Camry smart key programming',
  'Schlage B60N rekey procedure',
  '2020 Ford F-150 key fob replacement',
  'Kwikset SmartKey reset',
];

// ─── Main Screen ──────────────────────────────────────────────────
export default function AssistantScreen() {
  const {
    messages,
    isLoading,
    mode,
    conversationId,
    addMessage,
    setLoading,
    setMode,
    setConversationId,
    clearChat,
  } = useAssistantStore();

  const { user } = useAuth();
  const [input, setInput] = useState('');
  const [lookupData, setLookupData] = useState<any>(null);
  const [attachedImages, setAttachedImages] = useState<ImageAttachment[]>([]);
  const [zoomImage, setZoomImage] = useState<{
    uri: string;
    caption?: string;
    annotations?: Annotation[];
  } | null>(null);
  const flatListRef = useRef<FlatList>(null);

  // Track the most recent user image URI so assistant responses can reference it
  const lastUserImageUri = useRef<string | null>(null);

  // ─── Image picking ──────────────────────────────────────────────
  const pickImage = useCallback(async (source: 'camera' | 'library') => {
    try {
      if (source === 'camera') {
        const { status } = await ImagePicker.requestCameraPermissionsAsync();
        if (status !== 'granted') {
          Alert.alert('Permission needed', 'Camera access is required to take photos.');
          return;
        }
      } else {
        const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
        if (status !== 'granted') {
          Alert.alert('Permission needed', 'Photo library access is required to select images.');
          return;
        }
      }

      const result = await (source === 'camera'
        ? ImagePicker.launchCameraAsync({
            mediaTypes: ['images'],
            quality: 0.7,
            base64: true,
            allowsEditing: true,
            aspect: [4, 3],
          })
        : ImagePicker.launchImageLibraryAsync({
            mediaTypes: ['images'],
            quality: 0.7,
            base64: true,
            allowsMultipleSelection: true,
            selectionLimit: 4 - attachedImages.length,
          }));

      if (result.canceled) return;

      const newImages: ImageAttachment[] = result.assets.map((asset) => ({
        uri: asset.uri,
        base64: asset.base64 || undefined,
        width: asset.width,
        height: asset.height,
        mimeType: asset.mimeType || 'image/jpeg',
      }));

      setAttachedImages((prev) => [...prev, ...newImages].slice(0, 4));
    } catch {
      Alert.alert('Error', 'Could not access images. Please try again.');
    }
  }, [attachedImages.length]);

  const removeAttachedImage = useCallback((index: number) => {
    setAttachedImages((prev) => prev.filter((_, i) => i !== index));
  }, []);

  // ─── Send handler ───────────────────────────────────────────────
  const handleSend = useCallback(async () => {
    const text = input.trim();
    const hasImages = attachedImages.length > 0;
    if ((!text && !hasImages) || isLoading) return;
    setInput('');

    if (mode === 'quick-lookup') {
      if (!text) return;
      setLoading(true);
      try {
        const results = await quickLookup(text);
        setLookupData(results);
      } catch (err: any) {
        Alert.alert('Error', err.message);
      }
      setLoading(false);
      return;
    }

    // Chat mode
    const imagesToSend = [...attachedImages];
    setAttachedImages([]);

    // Track the user's image URI so the bot response can reference it
    if (imagesToSend.length > 0) {
      lastUserImageUri.current = imagesToSend[0].uri;
    }

    const userMsg: ChatMessage = {
      role: 'user',
      content: text || (hasImages ? 'What can you tell me about this?' : ''),
      timestamp: new Date().toISOString(),
      images: imagesToSend.length
        ? imagesToSend.map((img) => ({
            uri: img.uri,
            width: img.width,
            height: img.height,
            mimeType: img.mimeType,
          }))
        : undefined,
    };
    addMessage(userMsg);

    setLoading(true);
    try {
      const reply = await sendAssistantMessage(
        userMsg.content,
        messages,
        imagesToSend
      );
      const botMsg: ChatMessage = {
        role: 'assistant',
        content: reply,
        timestamp: new Date().toISOString(),
        // Attach the source image URI if user sent images (for annotation overlay)
        sourceImageUri: imagesToSend.length > 0 ? imagesToSend[0].uri : undefined,
      };
      addMessage(botMsg);

      // Save conversation
      const allMsgs = [...messages, userMsg, botMsg];
      if (user?.id) {
        if (conversationId) {
          await conversationService
            .updateConversation(conversationId, allMsgs)
            .catch(() => {});
        } else {
          const titleText = text || 'Image analysis';
          const title = titleText.length > 50 ? titleText.substring(0, 50) + '...' : titleText;
          const conv = await conversationService
            .createConversation(user.id, title, allMsgs)
            .catch(() => null);
          if (conv) setConversationId(conv.id);
        }
      }
    } catch (err: any) {
      const errMsg: ChatMessage = {
        role: 'assistant',
        content: `Error: ${err.message}`,
        timestamp: new Date().toISOString(),
      };
      addMessage(errMsg);
    }
    setLoading(false);
  }, [input, isLoading, mode, messages, user, conversationId, attachedImages]);

  const handleSuggestion = (text: string) => {
    setInput(text);
  };

  const openZoom = useCallback((uri: string, caption?: string, annotations?: Annotation[]) => {
    setZoomImage({ uri, caption, annotations });
  }, []);

  const canSend = input.trim() || attachedImages.length > 0;

  return (
    <SafeAreaView style={styles.container}>
      {/* Image Zoom Modal */}
      <ImageZoomModal
        visible={!!zoomImage}
        imageUri={zoomImage?.uri || null}
        caption={zoomImage?.caption}
        annotations={zoomImage?.annotations}
        onClose={() => setZoomImage(null)}
      />

      {/* Header */}
      <View style={styles.header}>
        <View style={styles.headerLeft}>
          <MaterialCommunityIcons name="robot" size={28} color={colors.accentPrimary} />
          <View>
            <Text style={styles.headerTitle}>AI Assistant</Text>
            <Text style={styles.headerSubtitle}>Locksmith Expert</Text>
          </View>
        </View>
        <View style={styles.headerActions}>
          <TouchableOpacity
            style={[
              styles.modeButton,
              mode === 'chat' && styles.modeButtonActive,
            ]}
            onPress={() => setMode('chat')}
          >
            <MaterialCommunityIcons
              name="chat"
              size={16}
              color={mode === 'chat' ? colors.bgPrimary : colors.textSecondary}
            />
            <Text
              style={[
                styles.modeText,
                mode === 'chat' && styles.modeTextActive,
              ]}
            >
              Chat
            </Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={[
              styles.modeButton,
              mode === 'quick-lookup' && styles.modeButtonActive,
            ]}
            onPress={() => {
              setMode('quick-lookup');
              setLookupData(null);
            }}
          >
            <MaterialCommunityIcons
              name="magnify"
              size={16}
              color={mode === 'quick-lookup' ? colors.bgPrimary : colors.textSecondary}
            />
            <Text
              style={[
                styles.modeText,
                mode === 'quick-lookup' && styles.modeTextActive,
              ]}
            >
              Quick Lookup
            </Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={styles.iconButton}
            onPress={() => {
              clearChat();
              setAttachedImages([]);
              lastUserImageUri.current = null;
            }}
          >
            <MaterialCommunityIcons name="plus" size={22} color={colors.textSecondary} />
          </TouchableOpacity>
        </View>
      </View>

      {/* Content */}
      <KeyboardAvoidingView
        style={styles.content}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        keyboardVerticalOffset={90}
      >
        {mode === 'chat' ? (
          <>
            {messages.length === 0 ? (
              <View style={styles.emptyChat}>
                <MaterialCommunityIcons
                  name="robot-happy"
                  size={64}
                  color={colors.accentPrimary}
                />
                <Text style={styles.emptyTitle}>How can I help?</Text>
                <Text style={styles.emptyDesc}>
                  Describe your locksmith job or snap a photo and I'll guide you step by step.
                </Text>
                <View style={styles.photoHint}>
                  <MaterialCommunityIcons name="camera" size={18} color={colors.accentSecondary} />
                  <Text style={styles.photoHintText}>
                    Send a photo and I'll annotate it with exact instructions — where to insert tools, attack points, and numbered steps
                  </Text>
                </View>
                <View style={styles.suggestions}>
                  {SUGGESTIONS.map((s) => (
                    <TouchableOpacity
                      key={s}
                      style={styles.suggestionChip}
                      onPress={() => handleSuggestion(s)}
                    >
                      <Text style={styles.suggestionText}>{s}</Text>
                    </TouchableOpacity>
                  ))}
                </View>
              </View>
            ) : (
              <FlatList
                ref={flatListRef}
                data={messages}
                renderItem={({ item }) => (
                  <MessageBubble message={item} onImagePress={openZoom} />
                )}
                keyExtractor={(_, idx) => String(idx)}
                contentContainerStyle={styles.messageList}
                onContentSizeChange={() =>
                  flatListRef.current?.scrollToEnd({ animated: true })
                }
                showsVerticalScrollIndicator={false}
              />
            )}
          </>
        ) : (
          <View style={styles.lookupContainer}>
            {!lookupData && !isLoading && (
              <View style={styles.emptyChat}>
                <MaterialCommunityIcons
                  name="card-search"
                  size={64}
                  color={colors.accentSecondary}
                />
                <Text style={styles.emptyTitle}>Quick Lookup</Text>
                <Text style={styles.emptyDesc}>
                  Type a year/make/model or lock brand to get the full spec sheet instantly.
                </Text>
                <View style={styles.suggestions}>
                  {['2021 Honda Civic', '2022 Toyota RAV4', 'Schlage B60N', 'Kwikset 980'].map(
                    (s) => (
                      <TouchableOpacity
                        key={s}
                        style={styles.suggestionChip}
                        onPress={() => handleSuggestion(s)}
                      >
                        <Text style={styles.suggestionText}>{s}</Text>
                      </TouchableOpacity>
                    )
                  )}
                </View>
              </View>
            )}
            {isLoading && (
              <View style={styles.emptyChat}>
                <ActivityIndicator size="large" color={colors.accentPrimary} />
                <Text style={styles.emptyDesc}>Searching database...</Text>
              </View>
            )}
            {lookupData && !isLoading && <QuickLookupResult data={lookupData} />}
          </View>
        )}

        {/* Attached Images Preview */}
        {mode === 'chat' && attachedImages.length > 0 && (
          <AttachedImagesPreview
            images={attachedImages}
            onRemove={removeAttachedImage}
          />
        )}

        {/* Input Bar */}
        <View style={styles.inputBar}>
          {mode === 'chat' && (
            <>
              <TouchableOpacity
                style={styles.mediaButton}
                onPress={() => pickImage('camera')}
                disabled={isLoading || attachedImages.length >= 4}
              >
                <MaterialCommunityIcons
                  name="camera"
                  size={22}
                  color={
                    attachedImages.length >= 4 ? colors.textTertiary : colors.accentSecondary
                  }
                />
              </TouchableOpacity>
              <TouchableOpacity
                style={styles.mediaButton}
                onPress={() => pickImage('library')}
                disabled={isLoading || attachedImages.length >= 4}
              >
                <MaterialCommunityIcons
                  name="image"
                  size={22}
                  color={
                    attachedImages.length >= 4 ? colors.textTertiary : colors.accentSecondary
                  }
                />
              </TouchableOpacity>
            </>
          )}
          <TextInput
            style={styles.textInput}
            placeholder={
              mode === 'chat'
                ? attachedImages.length
                  ? 'Add a description (optional)...'
                  : 'Describe your locksmith job...'
                : 'Year Make Model or Lock Name...'
            }
            placeholderTextColor={colors.textTertiary}
            value={input}
            onChangeText={setInput}
            multiline
            maxLength={2000}
            onSubmitEditing={handleSend}
            blurOnSubmit={false}
          />
          <TouchableOpacity
            style={[styles.sendButton, (!canSend || isLoading) && styles.sendButtonDisabled]}
            onPress={handleSend}
            disabled={!canSend || isLoading}
          >
            {isLoading ? (
              <ActivityIndicator size="small" color={colors.bgPrimary} />
            ) : (
              <MaterialCommunityIcons
                name={mode === 'chat' ? 'send' : 'magnify'}
                size={20}
                color={colors.bgPrimary}
              />
            )}
          </TouchableOpacity>
        </View>
      </KeyboardAvoidingView>
    </SafeAreaView>
  );
}

// ─── Styles ───────────────────────────────────────────────────────
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.bgPrimary,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
    backgroundColor: colors.bgSecondary,
  },
  headerLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
  },
  headerTitle: {
    fontSize: 18,
    fontWeight: '700',
    color: colors.textPrimary,
  },
  headerSubtitle: {
    fontSize: 12,
    color: colors.accentPrimary,
  },
  headerActions: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
  },
  modeButton: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    paddingHorizontal: 10,
    paddingVertical: 6,
    borderRadius: 16,
    backgroundColor: colors.bgTertiary,
  },
  modeButtonActive: {
    backgroundColor: colors.accentPrimary,
  },
  modeText: {
    fontSize: 12,
    fontWeight: '600',
    color: colors.textSecondary,
  },
  modeTextActive: {
    color: colors.bgPrimary,
  },
  iconButton: {
    padding: 6,
  },
  content: {
    flex: 1,
  },
  messageList: {
    padding: 16,
    paddingBottom: 8,
  },
  bubbleRow: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    marginBottom: 12,
    gap: 8,
  },
  bubbleRowUser: {
    justifyContent: 'flex-end',
  },
  avatarBot: {
    width: 32,
    height: 32,
    borderRadius: 16,
    backgroundColor: `${colors.accentPrimary}20`,
    alignItems: 'center',
    justifyContent: 'center',
  },
  avatarUser: {
    width: 32,
    height: 32,
    borderRadius: 16,
    backgroundColor: colors.accentPrimary,
    alignItems: 'center',
    justifyContent: 'center',
  },
  bubble: {
    maxWidth: '75%',
    padding: 12,
    borderRadius: 16,
  },
  bubbleUser: {
    backgroundColor: colors.accentPrimary,
    borderBottomRightRadius: 4,
  },
  bubbleBot: {
    backgroundColor: colors.bgSecondary,
    borderBottomLeftRadius: 4,
    borderWidth: 1,
    borderColor: colors.border,
  },
  bubbleBotWide: {
    maxWidth: '85%', // wider when containing annotated image
  },
  bubbleText: {
    fontSize: 15,
    color: colors.textPrimary,
    lineHeight: 22,
  },
  bubbleTextUser: {
    color: colors.bgPrimary,
  },
  bubbleTime: {
    fontSize: 10,
    color: colors.textTertiary,
    marginTop: 4,
    alignSelf: 'flex-end',
  },

  // ─── User image thumbnails ────────────────────────────────────
  imageGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 6,
    marginBottom: 8,
  },
  bubbleImage: {
    width: IMAGE_THUMB_SIZE,
    height: IMAGE_THUMB_SIZE,
    borderRadius: 12,
    backgroundColor: colors.bgTertiary,
  },

  // ─── Annotated image ─────────────────────────────────────────
  annotatedContainer: {
    marginBottom: 10,
    borderRadius: 10,
    overflow: 'hidden',
    position: 'relative',
  },
  annotatedBadge: {
    position: 'absolute',
    top: 8,
    left: 8,
    backgroundColor: 'rgba(0,0,0,0.7)',
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 10,
  },
  annotatedBadgeText: {
    fontSize: 9,
    fontWeight: '700',
    color: colors.textPrimary,
    letterSpacing: 0.8,
  },

  // ─── Annotation legend ────────────────────────────────────────
  legendContainer: {
    marginBottom: 8,
    gap: 4,
  },
  legendRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  legendDot: {
    width: 20,
    height: 20,
    borderRadius: 10,
    alignItems: 'center',
    justifyContent: 'center',
  },
  legendDotText: {
    fontSize: 10,
    fontWeight: '800',
    color: '#fff',
  },
  legendLabel: {
    fontSize: 12,
    color: colors.textSecondary,
    flex: 1,
  },

  // ─── Reference images (text cards) ────────────────────────────
  refContainer: {
    marginTop: 10,
    marginBottom: 4,
  },
  refHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    marginBottom: 6,
  },
  refHeaderText: {
    fontSize: 10,
    fontWeight: '700',
    color: colors.accentSecondary,
    letterSpacing: 0.8,
  },
  refCard: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 8,
    backgroundColor: colors.bgTertiary,
    borderRadius: 8,
    padding: 10,
    marginBottom: 6,
    borderWidth: 1,
    borderColor: colors.border,
  },
  refCardText: {
    flex: 1,
  },
  refDescription: {
    fontSize: 12,
    fontWeight: '600',
    color: colors.textPrimary,
    lineHeight: 16,
  },
  refSearch: {
    fontSize: 10,
    color: colors.textTertiary,
    marginTop: 2,
    fontStyle: 'italic',
  },

  // ─── Attached images preview (before sending) ─────────────────
  attachedPreview: {
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderTopWidth: 1,
    borderTopColor: colors.border,
    backgroundColor: colors.bgSecondary,
  },
  attachedThumb: {
    marginRight: 8,
    position: 'relative',
  },
  attachedImage: {
    width: 64,
    height: 64,
    borderRadius: 10,
    backgroundColor: colors.bgTertiary,
  },
  attachedRemove: {
    position: 'absolute',
    top: -6,
    right: -6,
    backgroundColor: colors.bgPrimary,
    borderRadius: 10,
  },

  // ─── Image zoom modal ────────────────────────────────────────
  zoomOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.95)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  zoomHeader: {
    position: 'absolute',
    top: 50,
    right: 20,
    zIndex: 10,
  },
  zoomCloseBtn: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: `${colors.bgSecondary}CC`,
    alignItems: 'center',
    justifyContent: 'center',
  },
  zoomCaptionBar: {
    position: 'absolute',
    bottom: 60,
    paddingHorizontal: 20,
    paddingVertical: 10,
    backgroundColor: `${colors.bgSecondary}CC`,
    borderRadius: 8,
  },
  zoomCaption: {
    fontSize: 14,
    fontWeight: '600',
    color: colors.textPrimary,
    textAlign: 'center',
  },

  // ─── Photo hint ───────────────────────────────────────────────
  photoHint: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    backgroundColor: `${colors.accentSecondary}15`,
    paddingHorizontal: 16,
    paddingVertical: 10,
    borderRadius: 10,
    marginTop: 8,
  },
  photoHintText: {
    fontSize: 13,
    color: colors.accentSecondary,
    flex: 1,
  },

  // ─── Empty states ─────────────────────────────────────────────
  emptyChat: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 32,
    gap: 12,
  },
  emptyTitle: {
    fontSize: 22,
    fontWeight: '700',
    color: colors.textPrimary,
  },
  emptyDesc: {
    fontSize: 15,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: 22,
  },
  suggestions: {
    marginTop: 16,
    gap: 8,
    width: '100%',
  },
  suggestionChip: {
    backgroundColor: colors.bgSecondary,
    borderWidth: 1,
    borderColor: colors.border,
    borderRadius: 12,
    paddingHorizontal: 16,
    paddingVertical: 12,
  },
  suggestionText: {
    fontSize: 14,
    color: colors.textSecondary,
  },

  // ─── Input bar ────────────────────────────────────────────────
  inputBar: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    padding: 12,
    gap: 6,
    borderTopWidth: 1,
    borderTopColor: colors.border,
    backgroundColor: colors.bgSecondary,
  },
  mediaButton: {
    width: 38,
    height: 38,
    borderRadius: 19,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.bgTertiary,
  },
  textInput: {
    flex: 1,
    backgroundColor: colors.bgTertiary,
    borderRadius: 20,
    paddingHorizontal: 16,
    paddingVertical: 10,
    fontSize: 15,
    color: colors.textPrimary,
    maxHeight: 100,
  },
  sendButton: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.accentPrimary,
    alignItems: 'center',
    justifyContent: 'center',
  },
  sendButtonDisabled: {
    opacity: 0.4,
  },

  // ─── Quick Lookup ─────────────────────────────────────────────
  lookupContainer: {
    flex: 1,
  },
  lookupResults: {
    flex: 1,
    padding: 16,
  },
  lookupHeader: {
    fontSize: 18,
    fontWeight: '700',
    color: colors.accentPrimary,
    marginBottom: 12,
    marginTop: 8,
  },
  specCard: {
    backgroundColor: colors.bgSecondary,
    borderRadius: 16,
    padding: 16,
    marginBottom: 12,
    borderWidth: 1,
    borderColor: colors.border,
  },
  specTitle: {
    fontSize: 17,
    fontWeight: '700',
    color: colors.textPrimary,
    marginBottom: 2,
  },
  specSubtitle: {
    fontSize: 13,
    color: colors.accentPrimary,
    marginBottom: 12,
  },
  specGrid: {
    gap: 6,
  },
  specRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: 4,
    borderBottomWidth: 1,
    borderBottomColor: `${colors.border}60`,
  },
  specLabel: {
    fontSize: 13,
    color: colors.textTertiary,
    width: 120,
  },
  specValue: {
    fontSize: 13,
    color: colors.textPrimary,
    fontWeight: '600',
    flex: 1,
    textAlign: 'right',
  },
  notesBox: {
    marginTop: 12,
    backgroundColor: `${colors.accentPrimary}10`,
    borderRadius: 8,
    padding: 12,
  },
  notesLabel: {
    fontSize: 12,
    fontWeight: '700',
    color: colors.accentPrimary,
    marginBottom: 4,
  },
  notesText: {
    fontSize: 13,
    color: colors.textSecondary,
    lineHeight: 18,
  },
  emptyLookup: {
    alignItems: 'center',
    padding: 48,
    gap: 12,
  },
  emptyText: {
    fontSize: 15,
    color: colors.textTertiary,
    textAlign: 'center',
  },
});
