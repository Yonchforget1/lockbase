import React from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useLocalSearchParams, useRouter, Stack } from 'expo-router';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../../src/lib/theme';
import { Badge } from '../../../src/components/ui/Badge';
import { SkeletonList } from '../../../src/components/ui/SkeletonLoader';
import { EmptyState } from '../../../src/components/ui/EmptyState';
import { useResidentialBrand, useLocks } from '../../../src/hooks/useLocks';

export default function BrandScreen() {
  const { brand: slug } = useLocalSearchParams<{ brand: string }>();
  const router = useRouter();
  const { data: brand } = useResidentialBrand(slug);
  const { data: locks, isLoading } = useLocks(brand?.id ?? '');

  return (
    <SafeAreaView style={styles.container}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: brand?.name ?? 'Locks',
          headerStyle: { backgroundColor: colors.bgPrimary },
          headerTintColor: colors.textPrimary,
          headerShadowVisible: false,
        }}
      />

      {isLoading ? (
        <SkeletonList count={6} />
      ) : !locks?.length ? (
        <EmptyState icon="lock" title="No Locks" message="No lock data available for this brand." />
      ) : (
        <FlatList
          data={locks}
          keyExtractor={(item) => item.id}
          contentContainerStyle={styles.list}
          renderItem={({ item }) => (
            <TouchableOpacity
              style={styles.listItem}
              onPress={() => router.push(`/(tabs)/house-locks/${slug}?lockId=${item.id}&lockName=${item.name}` as any)}
            >
              <View style={styles.itemLeft}>
                <View style={styles.itemIcon}>
                  <MaterialCommunityIcons name="lock" size={20} color={colors.accentSecondary} />
                </View>
                <View style={styles.itemText}>
                  <Text style={styles.itemTitle}>{item.name}</Text>
                  <Text style={styles.itemSubtitle}>Keyway: {item.keyway} · {item.num_pins} pins</Text>
                </View>
              </View>
              <View style={styles.itemRight}>
                <Badge label={item.lock_type} variant="info" />
                <MaterialCommunityIcons name="chevron-right" size={22} color={colors.textTertiary} />
              </View>
            </TouchableOpacity>
          )}
          ItemSeparatorComponent={() => <View style={styles.separator} />}
        />
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.bgPrimary,
  },
  list: {
    paddingHorizontal: 16,
  },
  listItem: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingVertical: 14,
    minHeight: 56,
  },
  itemLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
    gap: 12,
  },
  itemIcon: {
    width: 36,
    height: 36,
    borderRadius: 10,
    backgroundColor: 'rgba(59, 130, 246, 0.1)',
    alignItems: 'center',
    justifyContent: 'center',
  },
  itemText: {
    flex: 1,
  },
  itemTitle: {
    fontSize: 16,
    fontWeight: '500',
    color: colors.textPrimary,
  },
  itemSubtitle: {
    fontSize: 13,
    color: colors.textSecondary,
    marginTop: 2,
  },
  itemRight: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  separator: {
    height: 1,
    backgroundColor: colors.border,
    marginLeft: 48,
  },
});
