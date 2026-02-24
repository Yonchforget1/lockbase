import React, { useState } from 'react';
import { View, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useRouter } from 'expo-router';
import { colors } from '../../../src/lib/theme';
import { SearchBar } from '../../../src/components/ui/SearchBar';
import { SectionHeader } from '../../../src/components/ui/SectionHeader';
import { ManufacturerGrid } from '../../../src/components/car-keys/ManufacturerGrid';
import { SkeletonList } from '../../../src/components/ui/SkeletonLoader';
import { EmptyState } from '../../../src/components/ui/EmptyState';
import { useManufacturers } from '../../../src/hooks/useAutoKeys';
import type { Manufacturer } from '../../../src/types/database';

export default function CarKeysScreen() {
  const router = useRouter();
  const { data: manufacturers, isLoading, error } = useManufacturers();
  const [filter, setFilter] = useState('');

  const filtered = manufacturers?.filter((m) =>
    m.name.toLowerCase().includes(filter.toLowerCase())
  ) ?? [];

  const handleSelect = (manufacturer: Manufacturer) => {
    router.push(`/(tabs)/car-keys/${manufacturer.slug}` as any);
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <SectionHeader title="Car Keys" style={styles.title} />
        <SearchBar
          value={filter}
          onChangeText={setFilter}
          placeholder="Filter manufacturers..."
        />
      </View>

      {isLoading ? (
        <SkeletonList count={8} />
      ) : error ? (
        <EmptyState icon="alert-circle" title="Error" message="Failed to load manufacturers. Pull to refresh." />
      ) : filtered.length === 0 ? (
        <EmptyState icon="car" title="No Results" message={filter ? `No manufacturers matching "${filter}"` : 'No manufacturers available'} />
      ) : (
        <ManufacturerGrid manufacturers={filtered} onSelect={handleSelect} />
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.bgPrimary,
  },
  header: {
    paddingHorizontal: 16,
    paddingBottom: 12,
  },
  title: {
    marginTop: 8,
    fontSize: 28,
    fontWeight: '700',
    color: colors.textPrimary,
  },
});
