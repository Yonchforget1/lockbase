import { create } from 'zustand';
import type { ChatMessage } from '../services/assistant.service';

interface AssistantState {
  messages: ChatMessage[];
  isLoading: boolean;
  conversationId: string | null;
  mode: 'chat' | 'quick-lookup';
  setMessages: (messages: ChatMessage[]) => void;
  addMessage: (message: ChatMessage) => void;
  setLoading: (loading: boolean) => void;
  setConversationId: (id: string | null) => void;
  setMode: (mode: 'chat' | 'quick-lookup') => void;
  clearChat: () => void;
}

export const useAssistantStore = create<AssistantState>((set) => ({
  messages: [],
  isLoading: false,
  conversationId: null,
  mode: 'chat',
  setMessages: (messages) => set({ messages }),
  addMessage: (message) => set((state) => ({ messages: [...state.messages, message] })),
  setLoading: (isLoading) => set({ isLoading }),
  setConversationId: (conversationId) => set({ conversationId }),
  setMode: (mode) => set({ mode }),
  clearChat: () => set({ messages: [], conversationId: null }),
}));
