import React from 'react';
import { View, Text, ScrollView, TouchableOpacity, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import { colors } from '../../../src/lib/theme';
import { SectionHeader } from '../../../src/components/ui/SectionHeader';
import { useAuth } from '../../../src/hooks/useAuth';

function MenuItem({ icon, label, onPress, color = colors.textPrimary }: { icon: string; label: string; onPress: () => void; color?: string }) {
  return (
    <TouchableOpacity style={styles.menuItem} onPress={onPress}>
      <View style={styles.menuLeft}>
        <MaterialCommunityIcons name={icon as any} size={22} color={color} />
        <Text style={[styles.menuLabel, { color }]}>{label}</Text>
      </View>
      <MaterialCommunityIcons name="chevron-right" size={22} color={colors.textTertiary} />
    </TouchableOpacity>
  );
}

export default function ProfileScreen() {
  const { profile, isAuthenticated, signOut } = useAuth();
  const router = useRouter();

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView showsVerticalScrollIndicator={false} contentContainerStyle={styles.scrollContent}>
        <View style={styles.profileHeader}>
          <View style={styles.avatar}>
            <MaterialCommunityIcons name="account" size={40} color={colors.textTertiary} />
          </View>
          {isAuthenticated && profile ? (
            <>
              <Text style={styles.name}>{profile.display_name || profile.username}</Text>
              <Text style={styles.username}>@{profile.username}</Text>
              <View style={styles.stats}>
                <View style={styles.stat}>
                  <Text style={styles.statValue}>{profile.reputation}</Text>
                  <Text style={styles.statLabel}>Reputation</Text>
                </View>
                <View style={styles.statDivider} />
                <View style={styles.stat}>
                  <Text style={styles.statValue}>{profile.role}</Text>
                  <Text style={styles.statLabel}>Role</Text>
                </View>
              </View>
            </>
          ) : (
            <>
              <Text style={styles.name}>Guest</Text>
              <TouchableOpacity
                style={styles.loginButton}
                onPress={() => router.push('/(auth)/login' as any)}
              >
                <Text style={styles.loginText}>Sign In</Text>
              </TouchableOpacity>
            </>
          )}
        </View>

        <SectionHeader title="Content" />
        <View style={styles.menuGroup}>
          <MenuItem icon="bookmark" label="Bookmarks" onPress={() => {}} />
          <MenuItem icon="post" label="My Posts" onPress={() => {}} />
        </View>

        <SectionHeader title="Settings" />
        <View style={styles.menuGroup}>
          <MenuItem icon="bell" label="Notifications" onPress={() => {}} />
          <MenuItem icon="information" label="About LockBase" onPress={() => {}} />
        </View>

        {isAuthenticated && (
          <>
            <SectionHeader title="Account" />
            <View style={styles.menuGroup}>
              <MenuItem icon="logout" label="Sign Out" onPress={signOut} color={colors.error} />
            </View>
          </>
        )}

        <Text style={styles.version}>LockBase v1.0.0</Text>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.bgPrimary,
  },
  scrollContent: {
    paddingHorizontal: 16,
    paddingBottom: 48,
  },
  profileHeader: {
    alignItems: 'center',
    paddingVertical: 32,
  },
  avatar: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: colors.bgTertiary,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 16,
  },
  name: {
    fontSize: 24,
    fontWeight: '700',
    color: colors.textPrimary,
  },
  username: {
    fontSize: 14,
    color: colors.textSecondary,
    marginTop: 4,
  },
  stats: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 20,
    backgroundColor: colors.bgSecondary,
    borderRadius: 16,
    padding: 16,
    borderWidth: 1,
    borderColor: colors.border,
  },
  stat: {
    flex: 1,
    alignItems: 'center',
  },
  statValue: {
    fontSize: 20,
    fontWeight: '700',
    color: colors.accentPrimary,
    textTransform: 'capitalize',
  },
  statLabel: {
    fontSize: 12,
    color: colors.textTertiary,
    marginTop: 4,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
  },
  statDivider: {
    width: 1,
    height: 32,
    backgroundColor: colors.border,
    marginHorizontal: 16,
  },
  loginButton: {
    backgroundColor: colors.accentPrimary,
    borderRadius: 12,
    paddingHorizontal: 32,
    paddingVertical: 12,
    marginTop: 16,
  },
  loginText: {
    fontSize: 16,
    fontWeight: '700',
    color: colors.bgPrimary,
  },
  menuGroup: {
    backgroundColor: colors.bgSecondary,
    borderRadius: 16,
    borderWidth: 1,
    borderColor: colors.border,
    overflow: 'hidden',
  },
  menuItem: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 16,
    paddingVertical: 14,
    minHeight: 56,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  menuLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
  },
  menuLabel: {
    fontSize: 16,
    fontWeight: '500',
  },
  version: {
    fontSize: 12,
    color: colors.textTertiary,
    textAlign: 'center',
    marginTop: 32,
  },
});
