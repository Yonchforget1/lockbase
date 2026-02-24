import { create } from 'zustand';
import { Platform } from 'react-native';
import type { ChatMessage } from '../services/assistant.service';

let SecureStore: any = null;
if (Platform.OS !== 'web') {
  SecureStore = require('expo-secure-store');
}

const API_KEY_STORAGE_KEY = 'lockbase_anthropic_api_key';

interface AssistantState {
  apiKey: string;
  messages: ChatMessage[];
  isLoading: boolean;
  conversationId: string | null;
  mode: 'chat' | 'quick-lookup';
  setApiKey: (key: string) => Promise<void>;
  loadApiKey: () => Promise<void>;
  setMessages: (messages: ChatMessage[]) => void;
  addMessage: (message: ChatMessage) => void;
  setLoading: (loading: boolean) => void;
  setConversationId: (id: string | null) => void;
  setMode: (mode: 'chat' | 'quick-lookup') => void;
  clearChat: () => void;
}

export const useAssistantStore = create<AssistantState>((set) => ({
  apiKey: '',
  messages: [],
  isLoading: false,
  conversationId: null,
  mode: 'chat',

  setApiKey: async (key: string) => {
    if (SecureStore) {
      await SecureStore.setItemAsync(API_KEY_STORAGE_KEY, key);
    } else {
      // Web fallback
      try { localStorage.setItem(API_KEY_STORAGE_KEY, key); } catch {}
    }
    set({ apiKey: key });
  },

  loadApiKey: async () => {
    let key = '';
    if (SecureStore) {
      key = (await SecureStore.getItemAsync(API_KEY_STORAGE_KEY)) || '';
    } else {
      try { key = localStorage.getItem(API_KEY_STORAGE_KEY) || ''; } catch {}
    }
    set({ apiKey: key });
  },

  setMessages: (messages) => set({ messages }),
  addMessage: (message) => set((state) => ({ messages: [...state.messages, message] })),
  setLoading: (isLoading) => set({ isLoading }),
  setConversationId: (conversationId) => set({ conversationId }),
  setMode: (mode) => set({ mode }),
  clearChat: () => set({ messages: [], conversationId: null }),
}));
