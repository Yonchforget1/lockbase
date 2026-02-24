import { supabase } from '../lib/supabase';

export const residentialService = {
  async getBrands() {
    const { data, error } = await supabase
      .from('manufacturers')
      .select('*')
      .in('type', ['residential', 'both'])
      .order('name');
    if (error) throw error;
    return data;
  },

  async getBrand(slug: string) {
    const { data, error } = await supabase
      .from('manufacturers')
      .select('*')
      .eq('slug', slug)
      .single();
    if (error) throw error;
    return data;
  },

  async getLocks(manufacturerId: string) {
    const { data, error } = await supabase
      .from('residential_locks')
      .select('*')
      .eq('manufacturer_id', manufacturerId)
      .order('name');
    if (error) throw error;
    return data;
  },

  async getBrandWithLocks(slug: string) {
    const { data: brand, error: brandError } = await supabase
      .from('manufacturers')
      .select('*')
      .eq('slug', slug)
      .single();
    if (brandError) throw brandError;

    const { data: locks, error: locksError } = await supabase
      .from('residential_locks')
      .select('*')
      .eq('manufacturer_id', brand.id)
      .order('name');
    if (locksError) throw locksError;

    return { brand, locks };
  },

  async getLockDetail(lockId: string) {
    const { data, error } = await supabase
      .from('residential_locks')
      .select('*')
      .eq('id', lockId)
      .single();
    if (error) throw error;
    return data;
  },

  async getBlanks(lockId: string) {
    const { data, error } = await supabase
      .from('residential_key_blanks')
      .select('*')
      .eq('lock_id', lockId)
      .order('blank_number');
    if (error) throw error;
    return data;
  },

  async getBlankDetail(blankId: string) {
    const { data, error } = await supabase
      .from('residential_key_blanks')
      .select('*')
      .eq('id', blankId)
      .single();
    if (error) throw error;
    return data;
  },

  async searchLocks(query: string) {
    const { data, error } = await supabase
      .from('residential_locks')
      .select('*')
      .or(`name.ilike.%${query}%,keyway.ilike.%${query}%`)
      .limit(20);
    if (error) throw error;
    return data;
  },
};
