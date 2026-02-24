import React from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet, Animated } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../lib/theme';
import type { Manufacturer } from '../../types/database';

interface ManufacturerGridProps {
  manufacturers: Manufacturer[];
  onSelect: (manufacturer: Manufacturer) => void;
}

function ManufacturerItem({ item, onSelect, index }: { item: Manufacturer; onSelect: (m: Manufacturer) => void; index: number }) {
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
          <MaterialCommunityIcons name="car" size={28} color={colors.accentPrimary} />
        </View>
        <Text style={styles.name} numberOfLines={1}>{item.name}</Text>
        {item.country && <Text style={styles.country}>{item.country}</Text>}
      </TouchableOpacity>
    </Animated.View>
  );
}

export function ManufacturerGrid({ manufacturers, onSelect }: ManufacturerGridProps) {
  return (
    <FlatList
      data={manufacturers}
      numColumns={3}
      keyExtractor={(item) => item.id}
      renderItem={({ item, index }) => (
        <ManufacturerItem item={item} onSelect={onSelect} index={index} />
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
    backgroundColor: 'rgba(245, 166, 35, 0.1)',
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
