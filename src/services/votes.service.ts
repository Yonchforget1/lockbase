import { supabase } from '../lib/supabase';

export const votesService = {
  async vote(userId: string, votableType: 'post' | 'comment', votableId: string, value: 1 | -1) {
    const { data: existing } = await supabase
      .from('votes')
      .select('*')
      .eq('user_id', userId)
      .eq('votable_type', votableType)
      .eq('votable_id', votableId)
      .single();

    if (existing) {
      if (existing.value === value) {
        const { error } = await supabase.from('votes').delete().eq('id', existing.id);
        if (error) throw error;
        return { action: 'removed' as const, value: 0 };
      } else {
        const { error } = await supabase
          .from('votes')
          .update({ value })
          .eq('id', existing.id);
        if (error) throw error;
        return { action: 'changed' as const, value };
      }
    } else {
      const { error } = await supabase.from('votes').insert({
        user_id: userId,
        votable_type: votableType,
        votable_id: votableId,
        value,
      });
      if (error) throw error;
      return { action: 'added' as const, value };
    }
  },

  async getVoteStatus(userId: string, votableType: 'post' | 'comment', votableId: string) {
    const { data } = await supabase
      .from('votes')
      .select('value')
      .eq('user_id', userId)
      .eq('votable_type', votableType)
      .eq('votable_id', votableId)
      .single();
    return data?.value ?? 0;
  },
};

export const bookmarkService = {
  async toggle(userId: string, bookmarkableType: string, bookmarkableId: string) {
    const { data: existing } = await supabase
      .from('bookmarks')
      .select('id')
      .eq('user_id', userId)
      .eq('bookmarkable_type', bookmarkableType)
      .eq('bookmarkable_id', bookmarkableId)
      .single();

    if (existing) {
      await supabase.from('bookmarks').delete().eq('id', existing.id);
      return false;
    } else {
      await supabase.from('bookmarks').insert({
        user_id: userId,
        bookmarkable_type: bookmarkableType,
        bookmarkable_id: bookmarkableId,
      });
      return true;
    }
  },

  async getBookmarks(userId: string, type?: string) {
    let query = supabase
      .from('bookmarks')
      .select('*')
      .eq('user_id', userId)
      .order('created_at', { ascending: false });

    if (type && type !== 'all') {
      query = query.eq('bookmarkable_type', type);
    }

    const { data, error } = await query;
    if (error) throw error;
    return data;
  },

  async isBookmarked(userId: string, bookmarkableType: string, bookmarkableId: string) {
    const { data } = await supabase
      .from('bookmarks')
      .select('id')
      .eq('user_id', userId)
      .eq('bookmarkable_type', bookmarkableType)
      .eq('bookmarkable_id', bookmarkableId)
      .single();
    return !!data;
  },
};
