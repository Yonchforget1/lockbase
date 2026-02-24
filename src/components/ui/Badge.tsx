import React from 'react';
import { View, Text, StyleSheet, ViewStyle } from 'react-native';
import { colors } from '../../lib/theme';

interface BadgeProps {
  label: string;
  variant?: 'default' | 'success' | 'warning' | 'error' | 'info';
  style?: ViewStyle;
}

const variantColors = {
  default: { bg: colors.bgTertiary, text: colors.textSecondary },
  success: { bg: 'rgba(34, 197, 94, 0.15)', text: colors.success },
  warning: { bg: 'rgba(245, 158, 11, 0.15)', text: colors.warning },
  error: { bg: 'rgba(239, 68, 68, 0.15)', text: colors.error },
  info: { bg: 'rgba(59, 130, 246, 0.15)', text: colors.accentSecondary },
};

export function Badge({ label, variant = 'default', style }: BadgeProps) {
  const colorSet = variantColors[variant];
  return (
    <View style={[styles.badge, { backgroundColor: colorSet.bg }, style]}>
      <Text style={[styles.text, { color: colorSet.text }]}>{label}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  badge: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
    alignSelf: 'flex-start',
  },
  text: {
    fontSize: 12,
    fontWeight: '600',
    textTransform: 'uppercase',
    letterSpacing: 0.5,
  },
});
