import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { postsService } from '../services/posts.service';

export function usePosts(category?: string) {
  return useQuery({
    queryKey: ['posts', category],
    queryFn: () => postsService.getPosts(category),
  });
}

export function usePost(postId: string) {
  return useQuery({
    queryKey: ['post', postId],
    queryFn: () => postsService.getPost(postId),
    enabled: !!postId,
  });
}

export function useComments(postId: string) {
  return useQuery({
    queryKey: ['comments', postId],
    queryFn: () => postsService.getComments(postId),
    enabled: !!postId,
  });
}

export function useCreatePost() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: postsService.createPost,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['posts'] });
    },
  });
}

export function useCreateComment() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: postsService.createComment,
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: ['comments', variables.post_id] });
    },
  });
}

export function useReferencePosts(referenceType: string, referenceId: string) {
  return useQuery({
    queryKey: ['posts', 'reference', referenceType, referenceId],
    queryFn: () => postsService.getPostsForReference(referenceType, referenceId),
    enabled: !!referenceType && !!referenceId,
  });
}
