import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, StyleSheet } from 'react-native';
import { colors } from '../../lib/theme';

interface PostFormProps {
  onSubmit: (data: { title: string; body: string; category: string }) => void;
  loading?: boolean;
}

const categories = ['automotive', 'residential', 'general', 'tips'];

export function PostForm({ onSubmit, loading }: PostFormProps) {
  const [title, setTitle] = useState('');
  const [body, setBody] = useState('');
  const [category, setCategory] = useState('general');

  const handleSubmit = () => {
    if (!title.trim() || !body.trim()) return;
    onSubmit({ title: title.trim(), body: body.trim(), category });
  };

  return (
    <View style={styles.container}>
      <Text style={styles.label}>CATEGORY</Text>
      <View style={styles.categories}>
        {categories.map((cat) => (
          <TouchableOpacity
            key={cat}
            style={[styles.chip, category === cat && styles.activeChip]}
            onPress={() => setCategory(cat)}
          >
            <Text style={[styles.chipText, category === cat && styles.activeChipText]}>
              {cat}
            </Text>
          </TouchableOpacity>
        ))}
      </View>

      <Text style={styles.label}>TITLE</Text>
      <TextInput
        style={styles.input}
        value={title}
        onChangeText={setTitle}
        placeholder="What's your question or tip?"
        placeholderTextColor={colors.textTertiary}
        autoCapitalize="sentences"
      />

      <Text style={styles.label}>DETAILS</Text>
      <TextInput
        style={[styles.input, styles.textArea]}
        value={body}
        onChangeText={setBody}
        placeholder="Share your experience or ask for help..."
        placeholderTextColor={colors.textTertiary}
        multiline
        numberOfLines={6}
        textAlignVertical="top"
      />

      <TouchableOpacity
        style={[styles.submitButton, (!title.trim() || !body.trim() || loading) && styles.disabledButton]}
        onPress={handleSubmit}
        disabled={!title.trim() || !body.trim() || loading}
      >
        <Text style={styles.submitText}>{loading ? 'Posting...' : 'Post'}</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 16,
  },
  label: {
    fontSize: 12,
    fontWeight: '500',
    color: colors.textSecondary,
    letterSpacing: 0.5,
    marginBottom: 8,
    marginTop: 16,
  },
  categories: {
    flexDirection: 'row',
    gap: 8,
    flexWrap: 'wrap',
  },
  chip: {
    paddingHorizontal: 14,
    paddingVertical: 8,
    borderRadius: 20,
    backgroundColor: colors.bgTertiary,
  },
  activeChip: {
    backgroundColor: colors.accentPrimary,
  },
  chipText: {
    fontSize: 13,
    fontWeight: '500',
    color: colors.textSecondary,
    textTransform: 'capitalize',
  },
  activeChipText: {
    color: colors.bgPrimary,
  },
  input: {
    backgroundColor: colors.bgTertiary,
    borderRadius: 12,
    paddingHorizontal: 16,
    paddingVertical: 14,
    fontSize: 14,
    color: colors.textPrimary,
    borderWidth: 1,
    borderColor: colors.border,
  },
  textArea: {
    height: 140,
  },
  submitButton: {
    backgroundColor: colors.accentPrimary,
    borderRadius: 12,
    height: 48,
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 24,
  },
  disabledButton: {
    opacity: 0.5,
  },
  submitText: {
    fontSize: 16,
    fontWeight: '700',
    color: colors.bgPrimary,
  },
});
