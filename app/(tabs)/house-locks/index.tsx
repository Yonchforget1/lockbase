import React, { useState } from 'react';
import { View, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useRouter } from 'expo-router';
import { colors } from '../../../src/lib/theme';
import { SearchBar } from '../../../src/components/ui/SearchBar';
import { SectionHeader } from '../../../src/components/ui/SectionHeader';
import { BrandGrid } from '../../../src/components/house-locks/BrandGrid';
import { SkeletonList } from '../../../src/components/ui/SkeletonLoader';
import { EmptyState } from '../../../src/components/ui/EmptyState';
import { useResidentialBrands } from '../../../src/hooks/useLocks';
import type { Manufacturer } from '../../../src/types/database';

export default function HouseLocksScreen() {
  const router = useRouter();
  const { data: brands, isLoading, error } = useResidentialBrands();
  const [filter, setFilter] = useState('');

  const filtered = brands?.filter((b) =>
    b.name.toLowerCase().includes(filter.toLowerCase())
  ) ?? [];

  const handleSelect = (brand: Manufacturer) => {
    router.push(`/(tabs)/house-locks/${brand.slug}` as any);
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <SectionHeader title="House Locks" style={styles.title} />
        <SearchBar
          value={filter}
          onChangeText={setFilter}
          placeholder="Filter brands..."
        />
      </View>

      {isLoading ? (
        <SkeletonList count={6} />
      ) : error ? (
        <EmptyState icon="alert-circle" title="Error" message="Failed to load brands." />
      ) : filtered.length === 0 ? (
        <EmptyState icon="lock" title="No Results" message={filter ? `No brands matching "${filter}"` : 'No brands available'} />
      ) : (
        <BrandGrid brands={filtered} onSelect={handleSelect} />
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
