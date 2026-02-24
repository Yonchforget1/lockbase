import { supabase } from '../lib/supabase';
import type { SearchResult } from '../types/database';

export const searchService = {
  async searchAll(query: string): Promise<SearchResult[]> {
    if (!query || query.length < 2) return [];

    const [autoRes, lockRes, postRes] = await Promise.all([
      supabase
        .from('automotive_keys')
        .select('id, key_blank, model_name, key_type, chip_type')
        .or(`key_blank.ilike.%${query}%,model_name.ilike.%${query}%,chip_type.ilike.%${query}%`)
        .limit(10),
      supabase
        .from('residential_locks')
        .select('id, name, keyway, lock_type')
        .or(`name.ilike.%${query}%,keyway.ilike.%${query}%`)
        .limit(10),
      supabase
        .from('posts')
        .select('id, title, category, body')
        .or(`title.ilike.%${query}%,body.ilike.%${query}%`)
        .limit(10),
    ]);

    const results: SearchResult[] = [];

    if (autoRes.data) {
      autoRes.data.forEach((key) => {
        results.push({
          id: key.id,
          type: 'automotive_key',
          title: `${key.model_name} - ${key.key_blank}`,
          subtitle: key.key_type,
          match_text: key.chip_type || key.key_blank,
        });
      });
    }

    if (lockRes.data) {
      lockRes.data.forEach((lock) => {
        results.push({
          id: lock.id,
          type: 'residential_lock',
          title: lock.name,
          subtitle: `${lock.lock_type} - ${lock.keyway}`,
          match_text: lock.keyway,
        });
      });
    }

    if (postRes.data) {
      postRes.data.forEach((post) => {
        results.push({
          id: post.id,
          type: 'post',
          title: post.title,
          subtitle: post.category,
          match_text: post.body.substring(0, 100),
        });
      });
    }

    return results;
  },
};
