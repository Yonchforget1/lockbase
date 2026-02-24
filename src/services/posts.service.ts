import { supabase } from '../lib/supabase';

export const postsService = {
  async getPosts(category?: string, limit = 20, offset = 0) {
    let query = supabase
      .from('posts')
      .select('*, author:profiles(*)')
      .order('created_at', { ascending: false })
      .range(offset, offset + limit - 1);

    if (category && category !== 'all') {
      query = query.eq('category', category);
    }

    const { data, error } = await query;
    if (error) throw error;
    return data;
  },

  async getPost(postId: string) {
    const { data, error } = await supabase
      .from('posts')
      .select('*, author:profiles(*)')
      .eq('id', postId)
      .single();
    if (error) throw error;
    return data;
  },

  async createPost(post: {
    title: string;
    body: string;
    category: string;
    author_id: string;
    reference_type?: string;
    reference_id?: string;
  }) {
    const { data, error } = await supabase.from('posts').insert(post).select().single();
    if (error) throw error;
    return data;
  },

  async getComments(postId: string) {
    const { data, error } = await supabase
      .from('comments')
      .select('*, author:profiles(*)')
      .eq('post_id', postId)
      .order('created_at', { ascending: true });
    if (error) throw error;
    return data;
  },

  async createComment(comment: {
    post_id: string;
    author_id: string;
    body: string;
    parent_id?: string;
  }) {
    const { data, error } = await supabase.from('comments').insert(comment).select().single();
    if (error) throw error;
    return data;
  },

  async getPostsForReference(referenceType: string, referenceId: string) {
    const { data, error } = await supabase
      .from('posts')
      .select('*, author:profiles(*)')
      .eq('reference_type', referenceType)
      .eq('reference_id', referenceId)
      .order('created_at', { ascending: false });
    if (error) throw error;
    return data;
  },
};
