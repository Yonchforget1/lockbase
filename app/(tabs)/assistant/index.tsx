import React, { useState, useRef, useEffect, useCallback } from 'react';
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
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors, spacing } from '../../../src/lib/theme';
import { useAssistantStore } from '../../../src/stores/assistantStore';
import {
  sendAssistantMessage,
  quickLookup,
  conversationService,
  type ChatMessage,
} from '../../../src/services/assistant.service';
import { useAuth } from '../../../src/hooks/useAuth';

function ApiKeyModal({
  visible,
  onSave,
}: {
  visible: boolean;
  onSave: (key: string) => void;
}) {
  const [key, setKey] = useState('');

  if (!visible) return null;

  return (
    <View style={styles.modalOverlay}>
      <View style={styles.modalCard}>
        <MaterialCommunityIcons
          name="robot"
          size={48}
          color={colors.accentPrimary}
          style={{ alignSelf: 'center', marginBottom: 12 }}
        />
        <Text style={styles.modalTitle}>AI Assistant Setup</Text>
        <Text style={styles.modalDesc}>
          Enter your Anthropic API key to enable the AI locksmith assistant.
          Your key is stored securely on your device.
        </Text>
        <TextInput
          style={styles.apiKeyInput}
          placeholder="sk-ant-api03-..."
          placeholderTextColor={colors.textTertiary}
          value={key}
          onChangeText={setKey}
          autoCapitalize="none"
          autoCorrect={false}
          secureTextEntry
        />
        <TouchableOpacity
          style={[styles.saveButton, !key.startsWith('sk-') && styles.saveButtonDisabled]}
          onPress={() => key.startsWith('sk-') && onSave(key)}
          disabled={!key.startsWith('sk-')}
        >
          <Text style={styles.saveButtonText}>Save & Start</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}

function MessageBubble({ message }: { message: ChatMessage }) {
  const isUser = message.role === 'user';

  return (
    <View style={[styles.bubbleRow, isUser && styles.bubbleRowUser]}>
      {!isUser && (
        <View style={styles.avatarBot}>
          <MaterialCommunityIcons name="robot" size={18} color={colors.accentPrimary} />
        </View>
      )}
      <View style={[styles.bubble, isUser ? styles.bubbleUser : styles.bubbleBot]}>
        <Text style={[styles.bubbleText, isUser && styles.bubbleTextUser]}>
          {message.content}
        </Text>
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

      {(!data.autoKeys?.length && !data.locks?.length) && (
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

export default function AssistantScreen() {
  const {
    apiKey,
    messages,
    isLoading,
    mode,
    conversationId,
    setApiKey,
    loadApiKey,
    addMessage,
    setMessages,
    setLoading,
    setMode,
    setConversationId,
    clearChat,
  } = useAssistantStore();

  const { user } = useAuth();
  const [input, setInput] = useState('');
  const [lookupData, setLookupData] = useState<any>(null);
  const flatListRef = useRef<FlatList>(null);

  useEffect(() => {
    loadApiKey();
  }, []);

  const handleSend = useCallback(async () => {
    const text = input.trim();
    if (!text || isLoading) return;
    setInput('');

    if (mode === 'quick-lookup') {
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
    const userMsg: ChatMessage = {
      role: 'user',
      content: text,
      timestamp: new Date().toISOString(),
    };
    addMessage(userMsg);

    setLoading(true);
    try {
      const reply = await sendAssistantMessage(text, messages, apiKey);
      const botMsg: ChatMessage = {
        role: 'assistant',
        content: reply,
        timestamp: new Date().toISOString(),
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
          const title = text.length > 50 ? text.substring(0, 50) + '...' : text;
          const conv = await conversationService
            .createConversation(user.id, title, allMsgs)
            .catch(() => null);
          if (conv) setConversationId(conv.id);
        }
      }
    } catch (err: any) {
      const errMsg: ChatMessage = {
        role: 'assistant',
        content: `Error: ${err.message}\n\nPlease check your API key and try again.`,
        timestamp: new Date().toISOString(),
      };
      addMessage(errMsg);
    }
    setLoading(false);
  }, [input, isLoading, mode, messages, apiKey, user, conversationId]);

  const handleSuggestion = (text: string) => {
    setInput(text);
  };

  if (!apiKey) {
    return (
      <SafeAreaView style={styles.container}>
        <ApiKeyModal
          visible={true}
          onSave={async (key) => {
            await setApiKey(key);
          }}
        />
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={styles.container}>
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
          <TouchableOpacity style={styles.iconButton} onPress={clearChat}>
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
                  Describe your locksmith job and I'll guide you step by step.
                </Text>
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
                renderItem={({ item }) => <MessageBubble message={item} />}
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

        {/* Input Bar */}
        <View style={styles.inputBar}>
          <TextInput
            style={styles.textInput}
            placeholder={
              mode === 'chat'
                ? 'Describe your locksmith job...'
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
            style={[styles.sendButton, (!input.trim() || isLoading) && styles.sendButtonDisabled]}
            onPress={handleSend}
            disabled={!input.trim() || isLoading}
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
  inputBar: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    padding: 12,
    gap: 8,
    borderTopWidth: 1,
    borderTopColor: colors.border,
    backgroundColor: colors.bgSecondary,
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
  // Modal
  modalOverlay: {
    flex: 1,
    backgroundColor: colors.bgPrimary,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 24,
  },
  modalCard: {
    backgroundColor: colors.bgSecondary,
    borderRadius: 20,
    padding: 28,
    width: '100%',
    maxWidth: 400,
    borderWidth: 1,
    borderColor: colors.border,
  },
  modalTitle: {
    fontSize: 22,
    fontWeight: '700',
    color: colors.textPrimary,
    textAlign: 'center',
    marginBottom: 8,
  },
  modalDesc: {
    fontSize: 14,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: 20,
    marginBottom: 20,
  },
  apiKeyInput: {
    backgroundColor: colors.bgTertiary,
    borderRadius: 12,
    padding: 14,
    fontSize: 15,
    color: colors.textPrimary,
    borderWidth: 1,
    borderColor: colors.border,
    marginBottom: 16,
  },
  saveButton: {
    backgroundColor: colors.accentPrimary,
    borderRadius: 12,
    padding: 14,
    alignItems: 'center',
  },
  saveButtonDisabled: {
    opacity: 0.4,
  },
  saveButtonText: {
    fontSize: 16,
    fontWeight: '700',
    color: colors.bgPrimary,
  },
  // Quick Lookup
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
