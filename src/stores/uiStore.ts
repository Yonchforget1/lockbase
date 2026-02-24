import { create } from 'zustand';

interface UIState {
  isLoading: boolean;
  activeTab: string;
  setLoading: (loading: boolean) => void;
  setActiveTab: (tab: string) => void;
}

export const useUIStore = create<UIState>((set) => ({
  isLoading: false,
  activeTab: 'car-keys',
  setLoading: (isLoading) => set({ isLoading }),
  setActiveTab: (activeTab) => set({ activeTab }),
}));
