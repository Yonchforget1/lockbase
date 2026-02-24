import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, ScrollView, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useLocalSearchParams, Stack } from 'expo-router';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../src/lib/theme';
import { PostCard } from '../../src/components/community/PostCard';
import { CommentThread } from '../../src/components/community/CommentThread';
import { SkeletonList } from '../../src/components/ui/SkeletonLoader';
import { useAuth } from '../../src/hooks/useAuth';
import { usePost, useComments, useCreateComment } from '../../src/hooks/usePosts';

export default function PostDetailScreen() {
  const { postId } = useLocalSearchParams<{ postId: string }>();
  const { user } = useAuth();
  const { data: post, isLoading: postLoading } = usePost(postId);
  const { data: comments, isLoading: commentsLoading } = useComments(postId);
  const createComment = useCreateComment();
  const [commentText, setCommentText] = useState('');

  const handleComment = async () => {
    if (!user || !commentText.trim()) return;
    await createComment.mutateAsync({
      post_id: postId,
      author_id: user.id,
      body: commentText.trim(),
    });
    setCommentText('');
  };

  return (
    <SafeAreaView style={styles.container}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: 'Discussion',
          headerStyle: { backgroundColor: colors.bgPrimary },
          headerTintColor: colors.textPrimary,
          headerShadowVisible: false,
        }}
      />

      <ScrollView showsVerticalScrollIndicator={false} contentContainerStyle={styles.content}>
        {postLoading ? (
          <SkeletonList count={1} />
        ) : post ? (
          <PostCard post={post} />
        ) : null}

        <Text style={styles.commentsTitle}>COMMENTS</Text>

        {commentsLoading ? (
          <SkeletonList count={3} />
        ) : comments?.length ? (
          <CommentThread comments={comments} userId={user?.id} />
        ) : (
          <Text style={styles.noComments}>No comments yet. Be the first!</Text>
        )}
      </ScrollView>

      {user && (
        <View style={styles.commentBar}>
          <TextInput
            style={styles.commentInput}
            value={commentText}
            onChangeText={setCommentText}
            placeholder="Write a comment..."
            placeholderTextColor={colors.textTertiary}
            multiline
          />
          <TouchableOpacity
            style={[styles.sendBtn, !commentText.trim() && styles.sendBtnDisabled]}
            onPress={handleComment}
            disabled={!commentText.trim() || createComment.isPending}
          >
            <MaterialCommunityIcons name="send" size={20} color={commentText.trim() ? colors.bgPrimary : colors.textTertiary} />
          </TouchableOpacity>
        </View>
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.bgPrimary },
  content: { padding: 16, paddingBottom: 100 },
  commentsTitle: { fontSize: 12, fontWeight: '500', color: colors.textSecondary, letterSpacing: 0.5, marginTop: 24, marginBottom: 12 },
  noComments: { fontSize: 14, color: colors.textTertiary, textAlign: 'center', paddingVertical: 24 },
  commentBar: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    flexDirection: 'row',
    alignItems: 'flex-end',
    backgroundColor: colors.bgSecondary,
    borderTopWidth: 1,
    borderTopColor: colors.border,
    padding: 12,
    gap: 8,
  },
  commentInput: {
    flex: 1,
    backgroundColor: colors.bgTertiary,
    borderRadius: 12,
    paddingHorizontal: 14,
    paddingVertical: 10,
    fontSize: 14,
    color: colors.textPrimary,
    maxHeight: 100,
  },
  sendBtn: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.accentPrimary,
    alignItems: 'center',
    justifyContent: 'center',
  },
  sendBtnDisabled: {
    backgroundColor: colors.bgTertiary,
  },
});
