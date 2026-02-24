import { create } from 'zustand';

interface SearchState {
  query: string;
  recentSearches: string[];
  setQuery: (query: string) => void;
  addRecentSearch: (query: string) => void;
  clearRecentSearches: () => void;
}

export const useSearchStore = create<SearchState>((set, get) => ({
  query: '',
  recentSearches: [],
  setQuery: (query) => set({ query }),
  addRecentSearch: (query) => {
    const recent = get().recentSearches.filter((s) => s !== query);
    set({ recentSearches: [query, ...recent].slice(0, 10) });
  },
  clearRecentSearches: () => set({ recentSearches: [] }),
}));
