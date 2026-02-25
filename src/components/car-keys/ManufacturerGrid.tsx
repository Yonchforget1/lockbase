import React, { useState } from 'react';
import { View, Text, ScrollView, TouchableOpacity, StyleSheet, Image } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../lib/theme';
import type { Manufacturer } from '../../types/database';

interface ManufacturerGridProps {
  manufacturers: Manufacturer[];
  onSelect: (manufacturer: Manufacturer) => void;
}

function ManufacturerItem({ item, onSelect }: { item: Manufacturer; onSelect: (m: Manufacturer) => void }) {
  const [imgError, setImgError] = useState(false);
  const hasLogo = item.logo_url && !imgError;

  return (
    <TouchableOpacity
      style={styles.card}
      onPress={() => onSelect(item)}
      activeOpacity={0.7}
    >
      <View style={styles.iconContainer}>
        {hasLogo ? (
          <Image
            source={{ uri: item.logo_url! }}
            style={styles.logo}
            resizeMode="contain"
            onError={() => setImgError(true)}
          />
        ) : (
          <MaterialCommunityIcons name="car" size={28} color={colors.accentPrimary} />
        )}
      </View>
      <Text style={styles.name} numberOfLines={1}>{item.name}</Text>
      {item.country && <Text style={styles.country}>{item.country}</Text>}
    </TouchableOpacity>
  );
}

export function ManufacturerGrid({ manufacturers, onSelect }: ManufacturerGridProps) {
  return (
    <ScrollView contentContainerStyle={styles.grid} showsVerticalScrollIndicator={false}>
      {manufacturers.map((item) => (
        <View key={item.id} style={styles.gridItem}>
          <ManufacturerItem item={item} onSelect={onSelect} />
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
    backgroundColor: 'rgba(245, 166, 35, 0.1)',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 8,
    overflow: 'hidden',
  },
  logo: {
    width: 36,
    height: 36,
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
