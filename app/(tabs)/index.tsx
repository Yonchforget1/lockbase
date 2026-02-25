import React, { useState, useEffect, useRef, useCallback } from 'react';
import { View, Text, ScrollView, TouchableOpacity, StyleSheet, ActivityIndicator } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import { colors } from '../../src/lib/theme';
import { SearchBar } from '../../src/components/ui/SearchBar';
import { SectionHeader } from '../../src/components/ui/SectionHeader';
import { useAuth } from '../../src/hooks/useAuth';
import { useSearchStore } from '../../src/stores/searchStore';
import { searchService } from '../../src/services/search.service';
import type { SearchResult } from '../../src/types/database';

const categories = [
  { key: 'assistant', label: 'AI Assistant', icon: 'robot', color: '#A855F7', count: 'Job Guide' },
  { key: 'car-keys', label: 'Car Keys', icon: 'car-key', color: colors.accentPrimary, count: '65+ Brands' },
  { key: 'house-locks', label: 'House Locks', icon: 'lock', color: colors.accentSecondary, count: '11+ Brands' },
  { key: 'community', label: 'Community', icon: 'forum', color: colors.success, count: 'Discussions' },
];

const RESULT_ICONS: Record<string, string> = {
  automotive_key: 'car-key',
  residential_lock: 'lock',
  post: 'forum',
};
const RESULT_COLORS: Record<string, string> = {
  automotive_key: colors.accentPrimary,
  residential_lock: colors.accentSecondary,
  post: colors.success,
};

export default function HomeScreen() {
  const router = useRouter();
  const { profile } = useAuth();
  const { query, setQuery, recentSearches, addRecentSearch } = useSearchStore();
  const displayName = profile?.display_name || profile?.username || 'Locksmith';
  const [searchResults, setSearchResults] = useState<SearchResult[]>([]);
  const [searching, setSearching] = useState(false);
  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // Debounced search
  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
    const trimmed = query.trim();
    if (trimmed.length < 2) {
      setSearchResults([]);
      setSearching(false);
      return;
    }
    setSearching(true);
    debounceRef.current = setTimeout(async () => {
      try {
        const results = await searchService.searchAll(trimmed);
        setSearchResults(results);
      } catch {
        setSearchResults([]);
      }
      setSearching(false);
    }, 400);
    return () => { if (debounceRef.current) clearTimeout(debounceRef.current); };
  }, [query]);

  const handleResultPress = useCallback((result: SearchResult) => {
    addRecentSearch(query.trim());
    if (result.type === 'automotive_key') {
      router.push('/(tabs)/car-keys' as any);
    } else if (result.type === 'residential_lock') {
      router.push('/(tabs)/house-locks' as any);
    } else if (result.type === 'post') {
      router.push('/(tabs)/community' as any);
    }
  }, [query, router, addRecentSearch]);

  const today = new Date();
  const dateStr = today.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric' });
  const showResults = query.trim().length >= 2;

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView showsVerticalScrollIndicator={false} contentContainerStyle={styles.scrollContent}>
        <View style={styles.greeting}>
          <Text style={styles.greetingText}>Hey {displayName}</Text>
          <Text style={styles.dateText}>{dateStr}</Text>
        </View>

        <View style={styles.searchWrap}>
          <SearchBar
            value={query}
            onChangeText={setQuery}
            placeholder="Search keys, locks, brands..."
          />
        </View>

        {showResults && (
          <View style={styles.resultsSection}>
            {searching ? (
              <View style={styles.searchingWrap}>
                <ActivityIndicator size="small" color={colors.accentPrimary} />
                <Text style={styles.searchingText}>Searching...</Text>
              </View>
            ) : searchResults.length > 0 ? (
              <>
                <Text style={styles.resultsCount}>
                  {searchResults.length} result{searchResults.length !== 1 ? 's' : ''}
                </Text>
                {searchResults.map((result) => (
                  <TouchableOpacity
                    key={`${result.type}-${result.id}`}
                    style={styles.resultItem}
                    onPress={() => handleResultPress(result)}
                    activeOpacity={0.7}
                  >
                    <View style={[styles.resultIcon, { backgroundColor: `${RESULT_COLORS[result.type] || colors.textTertiary}15` }]}>
                      <MaterialCommunityIcons
                        name={(RESULT_ICONS[result.type] || 'magnify') as any}
                        size={20}
                        color={RESULT_COLORS[result.type] || colors.textTertiary}
                      />
                    </View>
                    <View style={styles.resultContent}>
                      <Text style={styles.resultTitle} numberOfLines={1}>{result.title}</Text>
                      {result.subtitle ? (
                        <Text style={styles.resultSubtitle} numberOfLines={1}>{result.subtitle}</Text>
                      ) : null}
                    </View>
                    <MaterialCommunityIcons name="chevron-right" size={20} color={colors.textTertiary} />
                  </TouchableOpacity>
                ))}
              </>
            ) : (
              <View style={styles.noResults}>
                <MaterialCommunityIcons name="magnify-close" size={32} color={colors.textTertiary} />
                <Text style={styles.noResultsText}>No results for "{query.trim()}"</Text>
              </View>
            )}
          </View>
        )}

        <SectionHeader title="Quick Access" />
        <View style={styles.categoryGrid}>
          {categories.map((item) => (
            <TouchableOpacity
              key={item.key}
              style={styles.categoryTouchable}
              onPress={() => router.push(`/(tabs)/${item.key}` as any)}
              activeOpacity={0.7}
            >
              <View style={[styles.categoryIcon, { backgroundColor: `${item.color}15` }]}>
                <MaterialCommunityIcons name={item.icon as any} size={32} color={item.color} />
              </View>
              <Text style={styles.categoryLabel}>{item.label}</Text>
              <Text style={styles.categoryCount}>{item.count}</Text>
            </TouchableOpacity>
          ))}
        </View>

        {recentSearches.length > 0 && (
          <>
            <SectionHeader title="Recent Searches" />
            <View style={styles.recentChips}>
              {recentSearches.slice(0, 5).map((search) => (
                <TouchableOpacity
                  key={search}
                  style={styles.chip}
                  onPress={() => setQuery(search)}
                >
                  <MaterialCommunityIcons name="history" size={14} color={colors.textTertiary} />
                  <Text style={styles.chipText}>{search}</Text>
                </TouchableOpacity>
              ))}
            </View>
          </>
        )}

        <SectionHeader title="Getting Started" />
        <View style={styles.tipCard}>
          <MaterialCommunityIcons name="lightbulb-on" size={24} color={colors.accentPrimary} />
          <View style={styles.tipContent}>
            <Text style={styles.tipTitle}>Welcome to LockBase</Text>
            <Text style={styles.tipBody}>
              Browse 65+ car key manufacturers and 11+ residential lock brands. Use the community to share tips and ask questions.
            </Text>
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.bgPrimary,
  },
  scrollContent: {
    paddingHorizontal: 16,
    paddingBottom: 32,
  },
  greeting: {
    paddingTop: 16,
    marginBottom: 20,
  },
  greetingText: {
    fontSize: 28,
    fontWeight: '700',
    color: colors.textPrimary,
  },
  dateText: {
    fontSize: 14,
    color: colors.textSecondary,
    marginTop: 4,
  },
  searchWrap: {
    marginBottom: 8,
  },
  categoryGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
  },
  categoryTouchable: {
    width: '48%',
    flexGrow: 1,
    backgroundColor: colors.bgSecondary,
    borderRadius: 16,
    padding: 20,
    borderWidth: 1,
    borderColor: colors.border,
    alignItems: 'center',
    minHeight: 130,
    justifyContent: 'center',
  },
  categoryIcon: {
    width: 56,
    height: 56,
    borderRadius: 28,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 10,
  },
  categoryLabel: {
    fontSize: 16,
    fontWeight: '600',
    color: colors.textPrimary,
  },
  categoryCount: {
    fontSize: 12,
    color: colors.textTertiary,
    marginTop: 4,
  },
  recentChips: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
  },
  chip: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    backgroundColor: colors.bgTertiary,
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 20,
  },
  chipText: {
    fontSize: 13,
    color: colors.textSecondary,
  },
  tipCard: {
    flexDirection: 'row',
    backgroundColor: colors.bgSecondary,
    borderRadius: 16,
    padding: 16,
    borderWidth: 1,
    borderColor: colors.border,
    gap: 12,
    alignItems: 'flex-start',
  },
  tipContent: {
    flex: 1,
  },
  tipTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: colors.textPrimary,
    marginBottom: 4,
  },
  tipBody: {
    fontSize: 14,
    color: colors.textSecondary,
    lineHeight: 20,
  },
  resultsSection: {
    marginBottom: 8,
  },
  searchingWrap: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    paddingVertical: 20,
  },
  searchingText: {
    fontSize: 14,
    color: colors.textSecondary,
  },
  resultsCount: {
    fontSize: 12,
    fontWeight: '500',
    color: colors.textTertiary,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
    marginBottom: 8,
    marginTop: 4,
  },
  resultItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.bgSecondary,
    borderRadius: 12,
    padding: 12,
    marginBottom: 8,
    borderWidth: 1,
    borderColor: colors.border,
    gap: 12,
  },
  resultIcon: {
    width: 40,
    height: 40,
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
  },
  resultContent: {
    flex: 1,
  },
  resultTitle: {
    fontSize: 15,
    fontWeight: '600',
    color: colors.textPrimary,
  },
  resultSubtitle: {
    fontSize: 13,
    color: colors.textSecondary,
    marginTop: 2,
  },
  noResults: {
    alignItems: 'center',
    paddingVertical: 24,
    gap: 8,
  },
  noResultsText: {
    fontSize: 14,
    color: colors.textTertiary,
  },
});
