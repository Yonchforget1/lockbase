import React from 'react';
import { ScrollView, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Stack, useRouter } from 'expo-router';
import { colors } from '../../src/lib/theme';
import { PostForm } from '../../src/components/community/PostForm';
import { useAuth } from '../../src/hooks/useAuth';
import { useCreatePost } from '../../src/hooks/usePosts';

export default function CreatePostScreen() {
  const router = useRouter();
  const { user } = useAuth();
  const createPost = useCreatePost();

  const handleSubmit = async (data: { title: string; body: string; category: string }) => {
    if (!user) return;
    await createPost.mutateAsync({
      ...data,
      author_id: user.id,
    });
    router.back();
  };

  return (
    <SafeAreaView style={styles.container}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: 'New Post',
          headerStyle: { backgroundColor: colors.bgPrimary },
          headerTintColor: colors.textPrimary,
          headerShadowVisible: false,
        }}
      />
      <ScrollView showsVerticalScrollIndicator={false}>
        <PostForm onSubmit={handleSubmit} loading={createPost.isPending} />
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.bgPrimary },
});
