import React from 'react';
import { SafeAreaView, StyleSheet } from 'react-native';
import { useLocalSearchParams, Stack } from 'expo-router';
import { colors } from '../../../src/lib/theme';
import { KeyDetailView } from '../../../src/components/car-keys/KeyDetailView';
import { SkeletonList } from '../../../src/components/ui/SkeletonLoader';
import { EmptyState } from '../../../src/components/ui/EmptyState';
import { useKeyDetail } from '../../../src/hooks/useAutoKeys';

export default function KeyDetailScreen() {
  const { keyId } = useLocalSearchParams<{ keyId: string }>();
  const { data: keyData, isLoading, error } = useKeyDetail(keyId ?? '');

  return (
    <SafeAreaView style={styles.container}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: keyData?.model_name ?? 'Key Detail',
          headerStyle: { backgroundColor: colors.bgPrimary },
          headerTintColor: colors.textPrimary,
          headerShadowVisible: false,
        }}
      />

      {isLoading ? (
        <SkeletonList count={6} />
      ) : error || !keyData ? (
        <EmptyState icon="key-variant" title="Not Found" message="Could not load key details." />
      ) : (
        <KeyDetailView keyData={keyData} />
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.bgPrimary,
  },
});
