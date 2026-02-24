import React from 'react';
import { View, TouchableOpacity, Text, StyleSheet } from 'react-native';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { colors } from '../../lib/theme';

interface VoteButtonsProps {
  voteCount: number;
  userVote: number;
  onUpvote: () => void;
  onDownvote: () => void;
  disabled?: boolean;
}

export function VoteButtons({ voteCount, userVote, onUpvote, onDownvote, disabled }: VoteButtonsProps) {
  return (
    <View style={styles.container}>
      <TouchableOpacity
        onPress={onUpvote}
        disabled={disabled}
        style={[styles.button, userVote === 1 && styles.activeUp]}
        hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
      >
        <MaterialCommunityIcons
          name="chevron-up"
          size={22}
          color={userVote === 1 ? colors.accentPrimary : colors.textTertiary}
        />
      </TouchableOpacity>
      <Text style={[styles.count, voteCount > 0 && styles.positive, voteCount < 0 && styles.negative]}>
        {voteCount}
      </Text>
      <TouchableOpacity
        onPress={onDownvote}
        disabled={disabled}
        style={[styles.button, userVote === -1 && styles.activeDown]}
        hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
      >
        <MaterialCommunityIcons
          name="chevron-down"
          size={22}
          color={userVote === -1 ? colors.error : colors.textTertiary}
        />
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    alignItems: 'center',
    gap: 2,
  },
  button: {
    width: 36,
    height: 36,
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 8,
  },
  activeUp: {
    backgroundColor: 'rgba(245, 166, 35, 0.1)',
  },
  activeDown: {
    backgroundColor: 'rgba(239, 68, 68, 0.1)',
  },
  count: {
    fontSize: 14,
    fontWeight: '700',
    color: colors.textSecondary,
  },
  positive: {
    color: colors.accentPrimary,
  },
  negative: {
    color: colors.error,
  },
});
