import React from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useLocalSearchParams, useRouter, Stack } from 'expo-router';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../../src/lib/theme';
import { SkeletonList } from '../../../src/components/ui/SkeletonLoader';
import { EmptyState } from '../../../src/components/ui/EmptyState';
import { useManufacturer, useVehicleModels } from '../../../src/hooks/useAutoKeys';

export default function ManufacturerScreen() {
  const { manufacturer: slug } = useLocalSearchParams<{ manufacturer: string }>();
  const router = useRouter();
  const { data: manufacturer } = useManufacturer(slug);
  const { data: models, isLoading } = useVehicleModels(manufacturer?.id ?? '');

  return (
    <SafeAreaView style={styles.container}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: manufacturer?.name ?? 'Models',
          headerStyle: { backgroundColor: colors.bgPrimary },
          headerTintColor: colors.textPrimary,
          headerShadowVisible: false,
        }}
      />

      {isLoading ? (
        <SkeletonList count={8} />
      ) : !models?.length ? (
        <EmptyState icon="car" title="No Models" message="No vehicle models available for this manufacturer." />
      ) : (
        <FlatList
          data={models}
          keyExtractor={(item) => item.id}
          contentContainerStyle={styles.list}
          renderItem={({ item }) => (
            <TouchableOpacity
              style={styles.listItem}
              onPress={() => router.push(`/(tabs)/car-keys/${slug}?modelId=${item.id}&modelName=${item.name}` as any)}
            >
              <View style={styles.itemLeft}>
                <View style={styles.itemIcon}>
                  <MaterialCommunityIcons name="car-side" size={20} color={colors.accentPrimary} />
                </View>
                <Text style={styles.itemTitle}>{item.name}</Text>
              </View>
              <MaterialCommunityIcons name="chevron-right" size={22} color={colors.textTertiary} />
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
    backgroundColor: 'rgba(245, 166, 35, 0.1)',
    alignItems: 'center',
    justifyContent: 'center',
  },
  itemTitle: {
    fontSize: 16,
    fontWeight: '500',
    color: colors.textPrimary,
  },
  separator: {
    height: 1,
    backgroundColor: colors.border,
    marginLeft: 48,
  },
});
