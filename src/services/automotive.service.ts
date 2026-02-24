import { supabase } from '../lib/supabase';

export const automotiveService = {
  async getManufacturers() {
    const { data, error } = await supabase
      .from('manufacturers')
      .select('*')
      .in('type', ['automotive', 'both'])
      .order('name');
    if (error) throw error;
    return data;
  },

  async getManufacturer(slug: string) {
    const { data, error } = await supabase
      .from('manufacturers')
      .select('*')
      .eq('slug', slug)
      .single();
    if (error) throw error;
    return data;
  },

  async getModels(manufacturerId: string) {
    const { data, error } = await supabase
      .from('vehicle_models')
      .select('*')
      .eq('manufacturer_id', manufacturerId)
      .order('name');
    if (error) throw error;
    return data;
  },

  async getManufacturerWithModels(slug: string) {
    const { data: manufacturer, error: mfrError } = await supabase
      .from('manufacturers')
      .select('*')
      .eq('slug', slug)
      .single();
    if (mfrError) throw mfrError;

    const { data: models, error: modelsError } = await supabase
      .from('vehicle_models')
      .select('*')
      .eq('manufacturer_id', manufacturer.id)
      .order('name');
    if (modelsError) throw modelsError;

    return { manufacturer, models };
  },

  async getYears(modelId: string) {
    const { data, error } = await supabase
      .from('vehicle_years')
      .select('*')
      .eq('model_id', modelId)
      .order('year_start', { ascending: false });
    if (error) throw error;
    return data;
  },

  async getKeys(yearId: string) {
    const { data, error } = await supabase
      .from('automotive_keys')
      .select('*')
      .eq('year_id', yearId)
      .order('key_type');
    if (error) throw error;
    return data;
  },

  async getKeyDetail(keyId: string) {
    const { data, error } = await supabase
      .from('automotive_keys')
      .select('*')
      .eq('id', keyId)
      .single();
    if (error) throw error;
    return data;
  },

  async searchKeys(query: string) {
    const { data, error } = await supabase
      .from('automotive_keys')
      .select('*')
      .or(`key_blank.ilike.%${query}%,model_name.ilike.%${query}%,chip_type.ilike.%${query}%,fcc_id.ilike.%${query}%,lishi_tool.ilike.%${query}%`)
      .limit(20);
    if (error) throw error;
    return data;
  },
};
