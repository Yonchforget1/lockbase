import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { colors } from '../../lib/theme';

interface PinningChartProps {
  pinningData: Record<string, unknown> | null;
  numPins: number;
  depths?: string | null;
}

export function PinningChart({ pinningData, numPins, depths }: PinningChartProps) {
  if (!pinningData && !depths) {
    return (
      <View style={styles.container}>
        <Text style={styles.noData}>No pinning chart available</Text>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>PINNING CHART</Text>
      <View style={styles.chart}>
        <View style={styles.headerRow}>
          {Array.from({ length: numPins }).map((_, i) => (
            <View key={i} style={styles.cell}>
              <Text style={styles.headerText}>{i + 1}</Text>
            </View>
          ))}
        </View>
        {depths && (
          <View style={styles.depthRow}>
            <Text style={styles.depthLabel}>Depths: {depths}</Text>
          </View>
        )}
        {pinningData && typeof pinningData === 'object' && (
          <View style={styles.dataSection}>
            {Object.entries(pinningData).map(([key, value]) => (
              <View key={key} style={styles.dataRow}>
                <Text style={styles.dataLabel}>{key}</Text>
                <Text style={styles.dataValue}>{String(value)}</Text>
              </View>
            ))}
          </View>
        )}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: colors.bgSecondary,
    borderRadius: 12,
    padding: 16,
    borderWidth: 1,
    borderColor: colors.border,
  },
  title: {
    fontSize: 12,
    fontWeight: '500',
    color: colors.textSecondary,
    letterSpacing: 0.5,
    marginBottom: 12,
  },
  noData: {
    fontSize: 14,
    color: colors.textTertiary,
    textAlign: 'center',
    paddingVertical: 16,
  },
  chart: {
    gap: 8,
  },
  headerRow: {
    flexDirection: 'row',
    gap: 4,
  },
  cell: {
    flex: 1,
    height: 36,
    backgroundColor: colors.bgTertiary,
    borderRadius: 8,
    alignItems: 'center',
    justifyContent: 'center',
  },
  headerText: {
    fontSize: 14,
    fontWeight: '700',
    color: colors.accentPrimary,
  },
  depthRow: {
    paddingVertical: 8,
  },
  depthLabel: {
    fontSize: 13,
    color: colors.textSecondary,
  },
  dataSection: {
    borderTopWidth: 1,
    borderTopColor: colors.border,
    paddingTop: 8,
    gap: 6,
  },
  dataRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  dataLabel: {
    fontSize: 12,
    color: colors.textTertiary,
    textTransform: 'capitalize',
  },
  dataValue: {
    fontSize: 13,
    color: colors.textPrimary,
    fontWeight: '500',
  },
});
