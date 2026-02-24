import 'react-native-url-polyfill/auto';
import { createClient } from '@supabase/supabase-js';
import { Platform } from 'react-native';
import type { Database } from '../types/database';

let storage: any = undefined;

if (Platform.OS !== 'web') {
  const SecureStore = require('expo-secure-store');
  storage = {
    getItem: (key: string) => SecureStore.getItemAsync(key),
    setItem: (key: string, value: string) => SecureStore.setItemAsync(key, value),
    removeItem: (key: string) => SecureStore.deleteItemAsync(key),
  };
}

const supabaseUrl = 'https://eptnkprttskodgnfeasg.supabase.co';
const supabaseAnonKey =
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVwdG5rcHJ0dHNrb2RnbmZlYXNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4OTk0OTEsImV4cCI6MjA4NzQ3NTQ5MX0.hvBkzBs139gRyaJL2zQkdtUzUdk9GYZH0wnCYR0F0ms';

export const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
  auth: {
    ...(storage ? { storage } : {}),
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: false,
  },
});
