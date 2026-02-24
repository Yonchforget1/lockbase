import React, { useRef, useEffect } from 'react';
import { View, Text, ScrollView, TouchableOpacity, StyleSheet, Animated } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import { colors } from '../../src/lib/theme';
import { SearchBar } from '../../src/components/ui/SearchBar';
import { SectionHeader } from '../../src/components/ui/SectionHeader';
import { useAuth } from '../../src/hooks/useAuth';
import { useSearchStore } from '../../src/stores/searchStore';

const categories = [
  { key: 'car-keys', label: 'Car Keys', icon: 'car-key', color: colors.accentPrimary, count: '65+ Brands' },
  { key: 'house-locks', label: 'House Locks', icon: 'lock', color: colors.accentSecondary, count: '11+ Brands' },
  { key: 'community', label: 'Community', icon: 'forum', color: colors.success, count: 'Discussions' },
  { key: 'profile', label: 'Bookmarks', icon: 'bookmark', color: colors.warning, count: 'Saved Items' },
];

function CategoryCard({ item, index, onPress }: { item: typeof categories[0]; index: number; onPress: () => void }) {
  const fadeAnim = useRef(new Animated.Value(0)).current;
  const scaleAnim = useRef(new Animated.Value(1)).current;

  useEffect(() => {
    Animated.timing(fadeAnim, {
      toValue: 1,
      duration: 400,
      delay: index * 100,
      useNativeDriver: true,
    }).start();
  }, []);

  return (
    <Animated.View style={[styles.categoryCard, { opacity: fadeAnim, transform: [{ scale: scaleAnim }] }]}>
      <TouchableOpacity
        style={styles.categoryTouchable}
        onPress={onPress}
        onPressIn={() => Animated.spring(scaleAnim, { toValue: 0.95, useNativeDriver: true, speed: 50 }).start()}
        onPressOut={() => Animated.spring(scaleAnim, { toValue: 1, useNativeDriver: true, speed: 50 }).start()}
        activeOpacity={1}
      >
        <View style={[styles.categoryIcon, { backgroundColor: `${item.color}15` }]}>
          <MaterialCommunityIcons name={item.icon as any} size={32} color={item.color} />
        </View>
        <Text style={styles.categoryLabel}>{item.label}</Text>
        <Text style={styles.categoryCount}>{item.count}</Text>
      </TouchableOpacity>
    </Animated.View>
  );
}

export default function HomeScreen() {
  const router = useRouter();
  const { profile } = useAuth();
  const { query, setQuery, recentSearches } = useSearchStore();
  const displayName = profile?.display_name || profile?.username || 'Locksmith';

  const today = new Date();
  const dateStr = today.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric' });

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

        <SectionHeader title="Quick Access" />
        <View style={styles.categoryGrid}>
          {categories.map((item, index) => (
            <CategoryCard
              key={item.key}
              item={item}
              index={index}
              onPress={() => router.push(`/(tabs)/${item.key}` as any)}
            />
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
  categoryCard: {
    width: '48%',
    flexGrow: 1,
  },
  categoryTouchable: {
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
});
