import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { Card } from '../ui/Card';
import { Badge } from '../ui/Badge';
import { colors } from '../../lib/theme';
import type { ResidentialLock } from '../../types/database';

interface LockCardProps {
  lock: ResidentialLock;
  onPress?: () => void;
}

export function LockCard({ lock, onPress }: LockCardProps) {
  return (
    <Card onPress={onPress} style={styles.container}>
      <View style={styles.header}>
        <View style={styles.iconWrap}>
          <MaterialCommunityIcons name="lock" size={22} color={colors.accentSecondary} />
        </View>
        <View style={styles.headerText}>
          <Text style={styles.title}>{lock.name}</Text>
          <Text style={styles.subtitle}>Keyway: {lock.keyway}</Text>
        </View>
        <Badge label={lock.lock_type} variant="info" />
      </View>

      <View style={styles.specs}>
        <View style={styles.specRow}>
          <Text style={styles.specLabel}>PINS</Text>
          <Text style={styles.specValue}>{lock.num_pins}</Text>
        </View>
        {lock.ansi_grade && (
          <View style={styles.specRow}>
            <Text style={styles.specLabel}>ANSI GRADE</Text>
            <Text style={styles.specValue}>{lock.ansi_grade}</Text>
          </View>
        )}
      </View>

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
      </View>
    </Card>
  );
}

const styles = StyleSheet.create({
  container: {
    marginBottom: 12,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  iconWrap: {
    width: 40,
    height: 40,
    borderRadius: 12,
    backgroundColor: 'rgba(59, 130, 246, 0.1)',
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 12,
  },
  headerText: {
    flex: 1,
  },
  title: {
    fontSize: 16,
    fontWeight: '600',
    color: colors.textPrimary,
  },
  subtitle: {
    fontSize: 13,
    color: colors.textSecondary,
    marginTop: 2,
  },
  specs: {
    borderTopWidth: 1,
    borderTopColor: colors.border,
    paddingTop: 12,
    gap: 8,
  },
  specRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  specLabel: {
    fontSize: 11,
    fontWeight: '500',
    color: colors.textTertiary,
    letterSpacing: 0.5,
  },
  specValue: {
    fontSize: 13,
    color: colors.textPrimary,
    fontWeight: '500',
  },
  flags: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
    marginTop: 12,
  },
  flag: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
  },
  flagText: {
    fontSize: 12,
    color: colors.textSecondary,
  },
});
