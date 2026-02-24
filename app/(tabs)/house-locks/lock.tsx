import React from 'react';
import { View, Text, ScrollView, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useLocalSearchParams, Stack } from 'expo-router';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../../src/lib/theme';
import { Badge } from '../../../src/components/ui/Badge';
import { Card } from '../../../src/components/ui/Card';
import { PinningChart } from '../../../src/components/house-locks/PinningChart';
import { SkeletonList } from '../../../src/components/ui/SkeletonLoader';
import { EmptyState } from '../../../src/components/ui/EmptyState';
import { useLockDetail, useKeyBlanks } from '../../../src/hooks/useLocks';
import type { ResidentialKeyBlank } from '../../../src/types/database';

function BlankCard({ blank }: { blank: ResidentialKeyBlank }) {
  return (
    <Card style={styles.blankCard}>
      <View style={styles.blankHeader}>
        <View style={styles.blankIconWrap}>
          <MaterialCommunityIcons name="key-variant" size={20} color={colors.accentPrimary} />
        </View>
        <View style={styles.blankHeaderText}>
          <Text style={styles.blankTitle}>{blank.blank_number}</Text>
          <Text style={styles.blankSubtitle}>{blank.brand} · {blank.keyway}</Text>
        </View>
      </View>

      <View style={styles.blankSpecs}>
        <View style={styles.blankSpecRow}>
          <Text style={styles.specLabel}>MATERIAL</Text>
          <Text style={styles.specValue}>{blank.material}</Text>
        </View>
        {blank.depth_spec && (
          <View style={styles.blankSpecRow}>
            <Text style={styles.specLabel}>DEPTHS</Text>
            <Text style={styles.specValue}>{blank.depth_spec}</Text>
          </View>
        )}
        {blank.spacing_spec && (
          <View style={styles.blankSpecRow}>
            <Text style={styles.specLabel}>SPACING</Text>
            <Text style={styles.specValue}>{blank.spacing_spec}</Text>
          </View>
        )}
      </View>

      {blank.notes && (
        <View style={styles.blankNotes}>
          <Text style={styles.notesText}>{blank.notes}</Text>
        </View>
      )}

      {(blank.pinning_chart || blank.depth_spec) && (
        <View style={styles.chartWrap}>
          <PinningChart pinningData={blank.pinning_chart} numPins={5} depths={blank.depth_spec} />
        </View>
      )}
    </Card>
  );
}

export default function LockScreen() {
  const { lockId, lockName } = useLocalSearchParams<{ lockId: string; lockName: string }>();
  const { data: lock, isLoading: lockLoading } = useLockDetail(lockId ?? '');
  const { data: blanks, isLoading: blanksLoading } = useKeyBlanks(lockId ?? '');

  const isLoading = lockLoading || blanksLoading;

  return (
    <SafeAreaView style={styles.container}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: lockName ?? 'Lock Details',
          headerStyle: { backgroundColor: colors.bgPrimary },
          headerTintColor: colors.textPrimary,
          headerShadowVisible: false,
        }}
      />

      {isLoading ? (
        <SkeletonList count={4} />
      ) : !lock ? (
        <EmptyState icon="lock" title="Not Found" message="Lock details not available." />
      ) : (
        <ScrollView contentContainerStyle={styles.scrollContent} showsVerticalScrollIndicator={false}>
          {/* Lock Hero */}
          <View style={styles.hero}>
            <View style={styles.heroIcon}>
              <MaterialCommunityIcons name="lock" size={48} color={colors.accentSecondary} />
            </View>
            <Text style={styles.heroTitle}>{lock.name}</Text>
            <View style={styles.heroBadges}>
              <Badge label={lock.lock_type} variant="info" />
              {lock.ansi_grade && <Badge label={`Grade ${lock.ansi_grade}`} variant="default" />}
            </View>
          </View>

          {/* Lock Specs */}
          <View style={styles.specsSection}>
            <Text style={styles.sectionTitle}>SPECIFICATIONS</Text>
            <Card>
              <View style={styles.specGrid}>
                <View style={styles.specItem}>
                  <Text style={styles.specLabel}>KEYWAY</Text>
                  <Text style={styles.specValue}>{lock.keyway}</Text>
                </View>
                <View style={styles.specItem}>
                  <Text style={styles.specLabel}>PINS</Text>
                  <Text style={styles.specValue}>{lock.num_pins}</Text>
                </View>
                {lock.security_pins && (
                  <View style={styles.specItem}>
                    <Text style={styles.specLabel}>SECURITY PINS</Text>
                    <Text style={styles.specValue}>{lock.security_pins}</Text>
                  </View>
                )}
                {lock.smart_features && (
                  <View style={styles.specItem}>
                    <Text style={styles.specLabel}>SMART FEATURES</Text>
                    <Text style={styles.specValue}>{lock.smart_features}</Text>
                  </View>
                )}
              </View>

              {/* Security Flags */}
              <View style={styles.flags}>
                {lock.bump_resistant && (
                  <View style={styles.flag}>
                    <MaterialCommunityIcons name="shield-check" size={14} color={colors.success} />
                    <Text style={styles.flagText}>Bump Resistant</Text>
                  </View>
                )}
                {lock.pick_resistant && (
                  <View style={styles.flag}>
                    <MaterialCommunityIcons name="shield-check" size={14} color={colors.success} />
                    <Text style={styles.flagText}>Pick Resistant</Text>
                  </View>
                )}
                {lock.drill_resistant && (
                  <View style={styles.flag}>
                    <MaterialCommunityIcons name="shield-check" size={14} color={colors.success} />
                    <Text style={styles.flagText}>Drill Resistant</Text>
                  </View>
                )}
                {!lock.bump_resistant && !lock.pick_resistant && !lock.drill_resistant && (
                  <Text style={styles.noFlags}>No special security features listed</Text>
                )}
              </View>
            </Card>
          </View>

          {/* Key Blanks */}
          <View style={styles.blanksSection}>
            <Text style={styles.sectionTitle}>KEY BLANKS</Text>
            {!blanks?.length ? (
              <Card>
                <Text style={styles.noFlags}>No key blank data available for this lock.</Text>
              </Card>
            ) : (
              blanks.map((blank) => <BlankCard key={blank.id} blank={blank} />)
            )}
          </View>
        </ScrollView>
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.bgPrimary,
  },
  scrollContent: {
    paddingBottom: 40,
  },
  hero: {
    alignItems: 'center',
    paddingVertical: 28,
    paddingHorizontal: 16,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  heroIcon: {
    width: 88,
    height: 88,
    borderRadius: 44,
    backgroundColor: 'rgba(59, 130, 246, 0.1)',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 14,
  },
  heroTitle: {
    fontSize: 24,
    fontWeight: '700',
    color: colors.textPrimary,
    textAlign: 'center',
  },
  heroBadges: {
    flexDirection: 'row',
    gap: 8,
    marginTop: 10,
  },
  specsSection: {
    paddingHorizontal: 16,
    paddingTop: 20,
  },
  sectionTitle: {
    fontSize: 12,
    fontWeight: '600',
    color: colors.textSecondary,
    letterSpacing: 0.5,
    marginBottom: 10,
  },
  specGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 0,
  },
  specItem: {
    width: '50%',
    paddingVertical: 8,
    paddingRight: 8,
  },
  specLabel: {
    fontSize: 11,
    fontWeight: '500',
    color: colors.textTertiary,
    letterSpacing: 0.5,
  },
  specValue: {
    fontSize: 14,
    color: colors.textPrimary,
    fontWeight: '500',
    marginTop: 3,
  },
  flags: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
    marginTop: 12,
    borderTopWidth: 1,
    borderTopColor: colors.border,
    paddingTop: 12,
  },
  flag: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 5,
  },
  flagText: {
    fontSize: 13,
    color: colors.textSecondary,
  },
  noFlags: {
    fontSize: 13,
    color: colors.textTertiary,
    fontStyle: 'italic',
  },
  blanksSection: {
    paddingHorizontal: 16,
    paddingTop: 24,
  },
  blankCard: {
    marginBottom: 12,
  },
  blankHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  blankIconWrap: {
    width: 36,
    height: 36,
    borderRadius: 10,
    backgroundColor: 'rgba(245, 166, 35, 0.1)',
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 10,
  },
  blankHeaderText: {
    flex: 1,
  },
  blankTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: colors.textPrimary,
  },
  blankSubtitle: {
    fontSize: 13,
    color: colors.textSecondary,
    marginTop: 2,
  },
  blankSpecs: {
    borderTopWidth: 1,
    borderTopColor: colors.border,
    paddingTop: 10,
    gap: 6,
  },
  blankSpecRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  blankNotes: {
    marginTop: 10,
    backgroundColor: colors.bgTertiary,
    borderRadius: 8,
    padding: 10,
  },
  notesText: {
    fontSize: 13,
    color: colors.textSecondary,
    lineHeight: 19,
  },
  chartWrap: {
    marginTop: 12,
  },
});
