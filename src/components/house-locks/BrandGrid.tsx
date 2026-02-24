import React from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet, Animated } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../lib/theme';
import type { Manufacturer } from '../../types/database';

interface BrandGridProps {
  brands: Manufacturer[];
  onSelect: (brand: Manufacturer) => void;
}

function BrandItem({ item, onSelect, index }: { item: Manufacturer; onSelect: (m: Manufacturer) => void; index: number }) {
  const scaleAnim = React.useRef(new Animated.Value(1)).current;
  const fadeAnim = React.useRef(new Animated.Value(0)).current;

  React.useEffect(() => {
    Animated.timing(fadeAnim, {
      toValue: 1,
      duration: 300,
      delay: index * 50,
      useNativeDriver: true,
    }).start();
  }, []);

  return (
    <Animated.View style={{ opacity: fadeAnim, transform: [{ scale: scaleAnim }], flex: 1, margin: 6 }}>
      <TouchableOpacity
        style={styles.card}
        onPress={() => onSelect(item)}
        onPressIn={() => {
          Animated.spring(scaleAnim, { toValue: 0.95, useNativeDriver: true, speed: 50 }).start();
        }}
        onPressOut={() => {
          Animated.spring(scaleAnim, { toValue: 1, useNativeDriver: true, speed: 50 }).start();
        }}
        activeOpacity={1}
      >
        <View style={styles.iconContainer}>
          <MaterialCommunityIcons name="door" size={28} color={colors.accentSecondary} />
        </View>
        <Text style={styles.name} numberOfLines={1}>{item.name}</Text>
        {item.country && <Text style={styles.country}>{item.country}</Text>}
      </TouchableOpacity>
    </Animated.View>
  );
}

export function BrandGrid({ brands, onSelect }: BrandGridProps) {
  return (
    <FlatList
      data={brands}
      numColumns={3}
      keyExtractor={(item) => item.id}
      renderItem={({ item, index }) => (
        <BrandItem item={item} onSelect={onSelect} index={index} />
      )}
      contentContainerStyle={styles.grid}
      showsVerticalScrollIndicator={false}
    />
  );
}

const styles = StyleSheet.create({
  grid: {
    paddingHorizontal: 10,
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
