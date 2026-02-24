import React from 'react';
import { View, Text, SectionList, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useLocalSearchParams, useRouter, Stack } from 'expo-router';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../../src/lib/theme';
import { KeySpecCard } from '../../../src/components/car-keys/KeySpecCard';
import { SkeletonList } from '../../../src/components/ui/SkeletonLoader';
import { EmptyState } from '../../../src/components/ui/EmptyState';
import { useVehicleYears, useAutomotiveKeys } from '../../../src/hooks/useAutoKeys';
import type { VehicleYear, AutomotiveKey } from '../../../src/types/database';

function YearSection({ year }: { year: VehicleYear }) {
  const router = useRouter();
  const { data: keys, isLoading } = useAutomotiveKeys(year.id);

  if (isLoading) {
    return (
      <View style={styles.yearLoading}>
        <SkeletonList count={1} />
      </View>
    );
  }

  if (!keys?.length) return null;

  return (
    <>
      {keys.map((key) => (
        <KeySpecCard
          key={key.id}
          keyData={key}
          onPress={() => router.push({ pathname: '/(tabs)/car-keys/key', params: { keyId: key.id } } as any)}
        />
      ))}
    </>
  );
}

export default function ModelScreen() {
  const { modelId, modelName } = useLocalSearchParams<{ modelId: string; modelName: string }>();
  const { data: years, isLoading } = useVehicleYears(modelId ?? '');

  const sections = (years ?? []).map((year) => ({
    title: `${year.year_start} – ${year.year_end}`,
    data: [year],
  }));

  return (
    <SafeAreaView style={styles.container}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: modelName ?? 'Key Info',
          headerStyle: { backgroundColor: colors.bgPrimary },
          headerTintColor: colors.textPrimary,
          headerShadowVisible: false,
        }}
      />

      {isLoading ? (
        <SkeletonList count={4} />
      ) : !years?.length ? (
        <EmptyState icon="key-variant" title="No Key Data" message="No key information available for this model yet." />
      ) : (
        <SectionList
          sections={sections}
          keyExtractor={(item) => item.id}
          contentContainerStyle={styles.list}
          renderSectionHeader={({ section: { title } }) => (
            <View style={styles.sectionHeader}>
              <MaterialCommunityIcons name="calendar-range" size={16} color={colors.accentPrimary} />
              <Text style={styles.sectionTitle}>{title}</Text>
            </View>
          )}
          renderItem={({ item }) => <YearSection year={item} />}
          stickySectionHeadersEnabled={false}
          SectionSeparatorComponent={() => <View style={styles.sectionSeparator} />}
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
    paddingBottom: 32,
  },
  sectionHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingVertical: 12,
    paddingTop: 20,
  },
  sectionTitle: {
    fontSize: 16,
    fontWeight: '700',
    color: colors.accentPrimary,
    letterSpacing: 0.3,
  },
  sectionSeparator: {
    height: 8,
  },
  yearLoading: {
    paddingVertical: 8,
  },
});
