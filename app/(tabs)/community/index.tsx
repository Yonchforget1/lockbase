import React, { useState } from 'react';
import { View, FlatList, TouchableOpacity, Text, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useRouter } from 'expo-router';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../../src/lib/theme';
import { SectionHeader } from '../../../src/components/ui/SectionHeader';
import { PostCard } from '../../../src/components/community/PostCard';
import { SkeletonList } from '../../../src/components/ui/SkeletonLoader';
import { EmptyState } from '../../../src/components/ui/EmptyState';
import { usePosts } from '../../../src/hooks/usePosts';

const tabs = ['all', 'automotive', 'residential', 'general', 'tips'];

export default function CommunityScreen() {
  const router = useRouter();
  const [activeTab, setActiveTab] = useState('all');
  const { data: posts, isLoading } = usePosts(activeTab);

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <View style={styles.headerRow}>
          <SectionHeader title="Community" style={styles.title} />
          <TouchableOpacity
            style={styles.newPostBtn}
            onPress={() => router.push('/post/create' as any)}
          >
            <MaterialCommunityIcons name="plus" size={20} color={colors.bgPrimary} />
            <Text style={styles.newPostText}>Post</Text>
          </TouchableOpacity>
        </View>

        <View style={styles.tabs}>
          {tabs.map((tab) => (
            <TouchableOpacity
              key={tab}
              style={[styles.tab, activeTab === tab && styles.activeTab]}
              onPress={() => setActiveTab(tab)}
            >
              <Text style={[styles.tabText, activeTab === tab && styles.activeTabText]}>
                {tab}
              </Text>
            </TouchableOpacity>
          ))}
        </View>
      </View>

      {isLoading ? (
        <SkeletonList count={5} />
      ) : !posts?.length ? (
        <EmptyState
          icon="forum-outline"
          title="No Posts Yet"
          message="Be the first to start a discussion!"
        />
      ) : (
        <FlatList
          data={posts}
          keyExtractor={(item) => item.id}
          renderItem={({ item }) => (
            <PostCard
              post={item}
              onPress={() => router.push(`/post/${item.id}` as any)}
            />
          )}
          contentContainerStyle={styles.list}
          showsVerticalScrollIndicator={false}
        />
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.bgPrimary,
  },
  header: {
    paddingHorizontal: 16,
    paddingBottom: 12,
  },
  headerRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  title: {
    marginTop: 8,
    fontSize: 28,
    fontWeight: '700',
    color: colors.textPrimary,
  },
  newPostBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    backgroundColor: colors.accentPrimary,
    paddingHorizontal: 14,
    paddingVertical: 8,
    borderRadius: 12,
  },
  newPostText: {
    fontSize: 14,
    fontWeight: '700',
    color: colors.bgPrimary,
  },
  tabs: {
    flexDirection: 'row',
    gap: 8,
    marginTop: 12,
  },
  tab: {
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 16,
    backgroundColor: colors.bgTertiary,
  },
  activeTab: {
    backgroundColor: colors.accentPrimary,
  },
  tabText: {
    fontSize: 13,
    fontWeight: '500',
    color: colors.textSecondary,
    textTransform: 'capitalize',
  },
  activeTabText: {
    color: colors.bgPrimary,
  },
  list: {
    paddingHorizontal: 16,
    paddingBottom: 32,
  },
});
