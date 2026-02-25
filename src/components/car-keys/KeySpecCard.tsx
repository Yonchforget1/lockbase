import React, { useState } from 'react';
import { View, Text, StyleSheet, Image } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { Card } from '../ui/Card';
import { Badge } from '../ui/Badge';
import { colors } from '../../lib/theme';
import type { AutomotiveKey } from '../../types/database';

interface KeySpecCardProps {
  keyData: AutomotiveKey;
  onPress?: () => void;
}

const keyTypeVariant = {
  standard: 'default' as const,
  transponder: 'info' as const,
  smart_key: 'success' as const,
  proximity: 'warning' as const,
};

export function KeySpecCard({ keyData, onPress }: KeySpecCardProps) {
  const [imgError, setImgError] = useState(false);
  const hasImage = keyData.image_url && !imgError;

  return (
    <Card onPress={onPress} style={styles.container}>
      <View style={styles.header}>
        <View style={styles.iconWrap}>
          {hasImage ? (
            <Image
              source={{ uri: keyData.image_url! }}
              style={styles.keyThumb}
              resizeMode="contain"
              onError={() => setImgError(true)}
            />
          ) : (
            <MaterialCommunityIcons name="key-variant" size={22} color={colors.accentPrimary} />
          )}
        </View>
        <View style={styles.headerText}>
          <Text style={styles.title}>{keyData.key_blank}</Text>
          <Text style={styles.subtitle}>
            {keyData.year_start}–{keyData.year_end}
          </Text>
        </View>
        <Badge label={keyData.key_type.replace('_', ' ')} variant={keyTypeVariant[keyData.key_type]} />
      </View>

      <View style={styles.specs}>
        {keyData.transponder_type && (
          <View style={styles.specRow}>
            <Text style={styles.specLabel}>TRANSPONDER</Text>
            <Text style={styles.specValue}>{keyData.transponder_type}</Text>
          </View>
        )}
        {keyData.chip_type && (
          <View style={styles.specRow}>
            <Text style={styles.specLabel}>CHIP</Text>
            <Text style={styles.specValue}>{keyData.chip_type}</Text>
          </View>
        )}
        {keyData.remote_frequency && (
          <View style={styles.specRow}>
            <Text style={styles.specLabel}>FREQUENCY</Text>
            <Text style={styles.specValue}>{keyData.remote_frequency}</Text>
          </View>
        )}
        {keyData.battery_type && (
          <View style={styles.specRow}>
            <Text style={styles.specLabel}>BATTERY</Text>
            <Text style={styles.specValue}>{keyData.battery_type}</Text>
          </View>
        )}
        {keyData.buttons && (
          <View style={styles.specRow}>
            <Text style={styles.specLabel}>BUTTONS</Text>
            <Text style={styles.specValue}>{keyData.buttons}</Text>
          </View>
        )}
        {keyData.lishi_tool && (
          <View style={styles.specRow}>
            <Text style={styles.specLabel}>LISHI TOOL</Text>
            <Text style={styles.specValue}>{keyData.lishi_tool}</Text>
          </View>
        )}
      </View>

      <View style={styles.flags}>
        {keyData.obd_programmable && (
          <View style={styles.flag}>
            <MaterialCommunityIcons name="check-circle" size={14} color={colors.success} />
            <Text style={styles.flagText}>OBD Programmable</Text>
          </View>
        )}
        {keyData.pin_code_required && (
          <View style={styles.flag}>
            <MaterialCommunityIcons name="lock" size={14} color={colors.warning} />
            <Text style={styles.flagText}>PIN Required</Text>
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
    backgroundColor: 'rgba(245, 166, 35, 0.1)',
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 12,
    overflow: 'hidden',
  },
  keyThumb: {
    width: 36,
    height: 36,
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
    gap: 16,
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
