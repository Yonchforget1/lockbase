import React from 'react';
import { View, Text, ScrollView, StyleSheet } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { Badge } from '../ui/Badge';
import { colors } from '../../lib/theme';
import type { AutomotiveKey } from '../../types/database';

interface KeyDetailViewProps {
  keyData: AutomotiveKey;
}

function SpecItem({ label, value, icon }: { label: string; value: string; icon: string }) {
  return (
    <View style={styles.specItem}>
      <MaterialCommunityIcons name={icon as any} size={18} color={colors.accentPrimary} />
      <View style={styles.specContent}>
        <Text style={styles.specLabel}>{label}</Text>
        <Text style={styles.specValue}>{value}</Text>
      </View>
    </View>
  );
}

export function KeyDetailView({ keyData }: KeyDetailViewProps) {
  const specs = [
    { label: 'Key Blank', value: keyData.key_blank, icon: 'key-variant' },
    { label: 'Year Range', value: `${keyData.year_start} – ${keyData.year_end}`, icon: 'calendar-range' },
    { label: 'Key Type', value: keyData.key_type.replace('_', ' '), icon: 'key-chain' },
    keyData.transponder_type && { label: 'Transponder', value: keyData.transponder_type, icon: 'radio-tower' },
    keyData.chip_type && { label: 'Chip Type', value: keyData.chip_type, icon: 'chip' },
    keyData.remote_frequency && { label: 'Remote Frequency', value: keyData.remote_frequency, icon: 'signal' },
    keyData.fcc_id && { label: 'FCC ID', value: keyData.fcc_id, icon: 'certificate' },
    keyData.ic_number && { label: 'IC Number', value: keyData.ic_number, icon: 'card-account-details' },
    keyData.emergency_key_blank && { label: 'Emergency Blank', value: keyData.emergency_key_blank, icon: 'key-alert' },
    keyData.test_key_blank && { label: 'Test Key', value: keyData.test_key_blank, icon: 'key-plus' },
    keyData.battery_type && { label: 'Battery', value: keyData.battery_type, icon: 'battery' },
    keyData.buttons && { label: 'Buttons', value: keyData.buttons, icon: 'gesture-tap-button' },
    keyData.lishi_tool && { label: 'Lishi Tool', value: keyData.lishi_tool, icon: 'tools' },
  ].filter(Boolean) as { label: string; value: string; icon: string }[];

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <View style={styles.hero}>
        <View style={styles.heroIcon}>
          <MaterialCommunityIcons name="key-variant" size={56} color={colors.accentPrimary} />
        </View>
        <Text style={styles.heroTitle}>{keyData.model_name}</Text>
        <Text style={styles.heroSubtitle}>{keyData.key_blank}</Text>
        <View style={styles.badges}>
          <Badge label={keyData.key_type.replace('_', ' ')} variant="info" />
          {keyData.obd_programmable && <Badge label="OBD" variant="success" />}
          {keyData.pin_code_required && <Badge label="PIN" variant="warning" />}
        </View>
      </View>

      <View style={styles.specsGrid}>
        {specs.map((spec) => (
          <SpecItem key={spec.label} {...spec} />
        ))}
      </View>

      {keyData.programming_notes && (
        <View style={styles.notesSection}>
          <Text style={styles.sectionTitle}>PROGRAMMING NOTES</Text>
          <View style={styles.notesCard}>
            <Text style={styles.notesText}>{keyData.programming_notes}</Text>
          </View>
        </View>
      )}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  hero: {
    alignItems: 'center',
    paddingVertical: 32,
    paddingHorizontal: 16,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  heroIcon: {
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: 'rgba(245, 166, 35, 0.1)',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 16,
  },
  heroTitle: {
    fontSize: 28,
    fontWeight: '700',
    color: colors.textPrimary,
    textAlign: 'center',
  },
  heroSubtitle: {
    fontSize: 16,
    color: colors.textSecondary,
    marginTop: 4,
  },
  badges: {
    flexDirection: 'row',
    gap: 8,
    marginTop: 12,
  },
  specsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    padding: 16,
    gap: 0,
  },
  specItem: {
    width: '50%',
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: 12,
    paddingRight: 8,
    gap: 10,
  },
  specContent: {
    flex: 1,
  },
  specLabel: {
    fontSize: 11,
    fontWeight: '500',
    color: colors.textTertiary,
    letterSpacing: 0.5,
    textTransform: 'uppercase',
  },
  specValue: {
    fontSize: 14,
    color: colors.textPrimary,
    fontWeight: '500',
    marginTop: 2,
    textTransform: 'capitalize',
  },
  notesSection: {
    paddingHorizontal: 16,
    paddingBottom: 32,
  },
  sectionTitle: {
    fontSize: 12,
    fontWeight: '500',
    color: colors.textSecondary,
    letterSpacing: 0.5,
    marginBottom: 8,
  },
  notesCard: {
    backgroundColor: colors.bgSecondary,
    borderRadius: 12,
    padding: 16,
    borderWidth: 1,
    borderColor: colors.border,
  },
  notesText: {
    fontSize: 14,
    color: colors.textPrimary,
    lineHeight: 22,
  },
});
