import { useState, useEffect, useRef } from 'react';
import { searchService } from '../services/search.service';
import { useSearchStore } from '../stores/searchStore';
import type { SearchResult } from '../types/database';

export function useSearch() {
  const { query, setQuery, addRecentSearch, recentSearches, clearRecentSearches } =
    useSearchStore();
  const [results, setResults] = useState<SearchResult[]>([]);
  const [loading, setLoading] = useState(false);
  const debounceRef = useRef<ReturnType<typeof setTimeout>>();

  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current);

    if (!query || query.length < 2) {
      setResults([]);
      setLoading(false);
      return;
    }

    setLoading(true);
    debounceRef.current = setTimeout(async () => {
      try {
        const data = await searchService.searchAll(query);
        setResults(data);
      } catch {
        setResults([]);
      } finally {
        setLoading(false);
      }
    }, 300);

    return () => {
      if (debounceRef.current) clearTimeout(debounceRef.current);
    };
  }, [query]);

  const submitSearch = () => {
    if (query.length >= 2) {
      addRecentSearch(query);
    }
  };

  return {
    query,
    setQuery,
    results,
    loading,
    recentSearches,
    clearRecentSearches,
    submitSearch,
  };
}
