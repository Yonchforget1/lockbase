const { createClient } = require('@supabase/supabase-js');
const supabase = createClient(
  'https://eptnkprttskodgnfeasg.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVwdG5rcHJ0dHNrb2RnbmZlYXNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4OTk0OTEsImV4cCI6MjA4NzQ3NTQ5MX0.hvBkzBs139gRyaJL2zQkdtUzUdk9GYZH0wnCYR0F0ms'
);

async function audit() {
  // Get all manufacturers
  const { data: mfrs } = await supabase.from('manufacturers').select('id, name, slug, type').order('name');
  console.log('=== MANUFACTURERS ===');
  console.log('Total:', mfrs.length);
  
  // Get automotive manufacturers
  const autoMfrs = mfrs.filter(m => m.type === 'automotive' || m.type === 'both');
  console.log('Automotive:', autoMfrs.length);
  
  // Get all keys grouped by manufacturer
  const { data: keys } = await supabase.from('automotive_keys').select('*').order('model_name');
  console.log('\n=== AUTOMOTIVE KEYS ===');
  console.log('Total keys:', keys.length);
  
  // Count keys per manufacturer model_name
  const byModel = {};
  keys.forEach(k => {
    if (!byModel[k.model_name]) byModel[k.model_name] = [];
    byModel[k.model_name].push(k);
  });
  console.log('Unique model names:', Object.keys(byModel).length);
  
  // Show first 30 models with their year ranges and key types
  console.log('\n=== SAMPLE DATA (first 30 models) ===');
  Object.entries(byModel).slice(0, 30).forEach(([model, keys]) => {
    keys.forEach(k => {
      console.log(`${model} | ${k.year_start}-${k.year_end} | ${k.key_type} | blank:${k.key_blank} | freq:${k.remote_frequency || 'N/A'} | fcc:${k.fcc_id || 'N/A'} | buttons:${k.buttons || 'N/A'} | img:${k.image_url ? 'YES' : 'NO'}`);
    });
  });
  
  // Count keys with/without images
  const withImg = keys.filter(k => k.image_url).length;
  console.log('\n=== IMAGE STATUS ===');
  console.log('With images:', withImg, '/', keys.length);
  console.log('Missing images:', keys.length - withImg);
  
  // Count keys with missing critical fields
  const missingFreq = keys.filter(k => !k.remote_frequency && k.key_type !== 'standard').length;
  const missingFcc = keys.filter(k => !k.fcc_id && k.key_type !== 'standard').length;
  console.log('\n=== MISSING DATA ===');
  console.log('Missing frequency (non-standard):', missingFreq);
  console.log('Missing FCC ID (non-standard):', missingFcc);
  
  // Show all automotive manufacturer names
  console.log('\n=== ALL AUTOMOTIVE MANUFACTURERS ===');
  autoMfrs.forEach(m => console.log(`${m.name} (${m.slug}) - ${m.type}`));
}

audit().catch(console.error);
