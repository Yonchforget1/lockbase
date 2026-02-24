import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { Card } from '../ui/Card';
import { Badge } from '../ui/Badge';
import { colors } from '../../lib/theme';
import type { Post } from '../../types/database';
import { formatDistanceToNow } from 'date-fns';

interface PostCardProps {
  post: Post;
  onPress?: () => void;
}

const categoryIcons: Record<string, string> = {
  automotive: 'car-key',
  residential: 'home-lock',
  general: 'forum',
  tips: 'lightbulb-on',
};

export function PostCard({ post, onPress }: PostCardProps) {
  const timeAgo = formatDistanceToNow(new Date(post.created_at), { addSuffix: true });

  return (
    <Card onPress={onPress} style={styles.container}>
      <View style={styles.header}>
        <View style={styles.avatar}>
          <MaterialCommunityIcons name="account" size={20} color={colors.textTertiary} />
        </View>
        <View style={styles.meta}>
          <Text style={styles.author}>{post.author?.display_name || post.author?.username || 'Anonymous'}</Text>
          <Text style={styles.time}>{timeAgo}</Text>
        </View>
        <Badge label={post.category} variant={post.category === 'tips' ? 'warning' : 'default'} />
      </View>

      <Text style={styles.title}>{post.title}</Text>
      <Text style={styles.body} numberOfLines={3}>{post.body}</Text>

      <View style={styles.footer}>
        <View style={styles.stat}>
          <MaterialCommunityIcons
            name={(categoryIcons[post.category] || 'forum') as any}
            size={16}
            color={colors.textTertiary}
          />
        </View>
        <View style={styles.stat}>
          <MaterialCommunityIcons name="arrow-up-bold" size={16} color={colors.textTertiary} />
          <Text style={styles.statText}>{post.vote_count}</Text>
        </View>
        <View style={styles.stat}>
          <MaterialCommunityIcons name="comment-outline" size={16} color={colors.textTertiary} />
        </View>
      </View>
    </Card>
  );
}

const styles = StyleSheet.create({
  container: {
    marginBottom: 12,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 10,
  },
  avatar: {
    width: 32,
    height: 32,
    borderRadius: 16,
    backgroundColor: colors.bgTertiary,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 10,
  },
  meta: {
    flex: 1,
  },
  author: {
    fontSize: 13,
    fontWeight: '600',
    color: colors.textPrimary,
  },
  time: {
    fontSize: 11,
    color: colors.textTertiary,
    marginTop: 1,
  },
  title: {
    fontSize: 16,
    fontWeight: '600',
    color: colors.textPrimary,
    marginBottom: 6,
  },
  body: {
    fontSize: 14,
    color: colors.textSecondary,
    lineHeight: 20,
    marginBottom: 12,
  },
  footer: {
    flexDirection: 'row',
    gap: 16,
    borderTopWidth: 1,
    borderTopColor: colors.border,
    paddingTop: 10,
  },
  stat: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
  },
  statText: {
    fontSize: 12,
    color: colors.textTertiary,
    fontWeight: '500',
  },
});
