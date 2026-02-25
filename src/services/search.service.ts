import { supabase } from '../lib/supabase';
import type { SearchResult } from '../types/database';

export const searchService = {
  async searchAll(query: string): Promise<SearchResult[]> {
    if (!query || query.length < 2) return [];

    const [autoRes, lockRes, postRes, mfrLockRes] = await Promise.all([
      supabase
        .from('automotive_keys')
        .select('id, key_blank, model_name, key_type, chip_type')
        .or(`key_blank.ilike.%${query}%,model_name.ilike.%${query}%,chip_type.ilike.%${query}%`)
        .limit(10),
      supabase
        .from('residential_locks')
        .select('id, name, keyway, lock_type, slug, manufacturers(name)')
        .or(`name.ilike.%${query}%,keyway.ilike.%${query}%,slug.ilike.%${query}%`)
        .limit(10),
      supabase
        .from('posts')
        .select('id, title, category, body')
        .or(`title.ilike.%${query}%,body.ilike.%${query}%`)
        .limit(10),
      // Also fetch all locks with manufacturer to match brand names
      supabase
        .from('residential_locks')
        .select('id, name, keyway, lock_type, slug, manufacturers(name)')
        .limit(50),
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

    // Combine direct lock matches with manufacturer-name matches
    const lockIds = new Set<string>();
    const addLock = (lock: any) => {
      if (lockIds.has(lock.id)) return;
      lockIds.add(lock.id);
      const mfrName = (lock.manufacturers as any)?.name || '';
      results.push({
        id: lock.id,
        type: 'residential_lock',
        title: mfrName ? `${mfrName} ${lock.name}` : lock.name,
        subtitle: `${lock.lock_type} - ${lock.keyway}`,
        match_text: lock.keyway,
      });
    };

    if (lockRes.data) {
      lockRes.data.forEach(addLock);
    }

    // Match locks by manufacturer name (handles "Schlage", "Kwikset", etc.)
    if (mfrLockRes.data) {
      const words = query.toLowerCase().split(/\s+/).filter(Boolean);
      mfrLockRes.data.forEach((lock: any) => {
        const lockText = `${(lock.manufacturers as any)?.name || ''} ${lock.name} ${lock.slug || ''}`.toLowerCase();
        if (words.every((w: string) => lockText.includes(w))) {
          addLock(lock);
        }
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
