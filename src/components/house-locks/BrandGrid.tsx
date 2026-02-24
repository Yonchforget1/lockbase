import React from 'react';
import { View, Text, ScrollView, TouchableOpacity, StyleSheet } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../lib/theme';
import type { Manufacturer } from '../../types/database';

interface BrandGridProps {
  brands: Manufacturer[];
  onSelect: (brand: Manufacturer) => void;
}

function BrandItem({ item, onSelect }: { item: Manufacturer; onSelect: (m: Manufacturer) => void }) {
  return (
    <TouchableOpacity
      style={styles.card}
      onPress={() => onSelect(item)}
      activeOpacity={0.7}
    >
      <View style={styles.iconContainer}>
        <MaterialCommunityIcons name="door" size={28} color={colors.accentSecondary} />
      </View>
      <Text style={styles.name} numberOfLines={1}>{item.name}</Text>
      {item.country && <Text style={styles.country}>{item.country}</Text>}
    </TouchableOpacity>
  );
}

export function BrandGrid({ brands, onSelect }: BrandGridProps) {
  return (
    <ScrollView contentContainerStyle={styles.grid} showsVerticalScrollIndicator={false}>
      {brands.map((item) => (
        <View key={item.id} style={styles.gridItem}>
          <BrandItem item={item} onSelect={onSelect} />
        </View>
      ))}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  grid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    paddingHorizontal: 10,
    paddingBottom: 32,
  },
  gridItem: {
    width: '33.33%',
    padding: 6,
  },
  card: {
    backgroundColor: colors.bgSecondary,
    borderRadius: 16,
    padding: 14,
    alignItems: 'center',
    borderWidth: 1,
    borderColor: colors.border,
    minHeight: 110,
    justifyContent: 'center',
  },
  iconContainer: {
    width: 48,
    height: 48,
    borderRadius: 24,
    backgroundColor: 'rgba(59, 130, 246, 0.1)',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 8,
  },
  name: {
    fontSize: 13,
    fontWeight: '600',
    color: colors.textPrimary,
    textAlign: 'center',
  },
  country: {
    fontSize: 11,
    color: colors.textTertiary,
    marginTop: 2,
  },
});
