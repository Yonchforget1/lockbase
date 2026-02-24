import React from 'react';
import { Text, StyleSheet, ViewStyle } from 'react-native';
import { colors } from '../../lib/theme';

interface SectionHeaderProps {
  title: string;
  style?: ViewStyle;
}

export function SectionHeader({ title, style }: SectionHeaderProps) {
  return <Text style={[styles.header, style]}>{title}</Text>;
}

const styles = StyleSheet.create({
  header: {
    fontSize: 12,
    fontWeight: '500',
    color: colors.textSecondary,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
    marginTop: 24,
    marginBottom: 8,
  },
});
