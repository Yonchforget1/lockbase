import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { VoteButtons } from '../ui/VoteButtons';
import { colors } from '../../lib/theme';
import type { Comment } from '../../types/database';
import { formatDistanceToNow } from 'date-fns';

interface CommentThreadProps {
  comments: Comment[];
  userId?: string;
  onVote?: (commentId: string, value: 1 | -1) => void;
}

function CommentItem({ comment, isReply, onVote, userId }: {
  comment: Comment;
  isReply?: boolean;
  onVote?: (commentId: string, value: 1 | -1) => void;
  userId?: string;
}) {
  const timeAgo = formatDistanceToNow(new Date(comment.created_at), { addSuffix: true });

  return (
    <View style={[styles.comment, isReply && styles.reply]}>
      <View style={styles.commentHeader}>
        <View style={styles.avatar}>
          <MaterialCommunityIcons name="account" size={16} color={colors.textTertiary} />
        </View>
        <Text style={styles.author}>
          {comment.author?.display_name || comment.author?.username || 'Anonymous'}
        </Text>
        <Text style={styles.dot}>·</Text>
        <Text style={styles.time}>{timeAgo}</Text>
      </View>
      <Text style={styles.body}>{comment.body}</Text>
      <View style={styles.actions}>
        <VoteButtons
          voteCount={comment.vote_count}
          userVote={0}
          onUpvote={() => onVote?.(comment.id, 1)}
          onDownvote={() => onVote?.(comment.id, -1)}
          disabled={!userId}
        />
      </View>
    </View>
  );
}

export function CommentThread({ comments, userId, onVote }: CommentThreadProps) {
  const topLevel = comments.filter((c) => !c.parent_id);
  const replies = comments.filter((c) => c.parent_id);

  return (
    <View style={styles.container}>
      {topLevel.map((comment) => (
        <View key={comment.id}>
          <CommentItem comment={comment} onVote={onVote} userId={userId} />
          {replies
            .filter((r) => r.parent_id === comment.id)
            .map((reply) => (
              <CommentItem key={reply.id} comment={reply} isReply onVote={onVote} userId={userId} />
            ))}
        </View>
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    gap: 4,
  },
  comment: {
    paddingVertical: 12,
    paddingHorizontal: 16,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  reply: {
    marginLeft: 32,
    borderLeftWidth: 2,
    borderLeftColor: colors.border,
  },
  commentHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    marginBottom: 6,
  },
  avatar: {
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: colors.bgTertiary,
    alignItems: 'center',
    justifyContent: 'center',
  },
  author: {
    fontSize: 13,
    fontWeight: '600',
    color: colors.textPrimary,
  },
  dot: {
    color: colors.textTertiary,
  },
  time: {
    fontSize: 11,
    color: colors.textTertiary,
  },
  body: {
    fontSize: 14,
    color: colors.textSecondary,
    lineHeight: 20,
    marginLeft: 30,
  },
  actions: {
    flexDirection: 'row',
    marginLeft: 30,
    marginTop: 6,
  },
});
