import { MD3DarkTheme, configureFonts } from 'react-native-paper';

export const colors = {
  bgPrimary: '#0F1117',
  bgSecondary: '#1A1D27',
  bgTertiary: '#242836',
  accentPrimary: '#F5A623',
  accentSecondary: '#3B82F6',
  success: '#22C55E',
  warning: '#F59E0B',
  error: '#EF4444',
  textPrimary: '#F8FAFC',
  textSecondary: '#94A3B8',
  textTertiary: '#64748B',
  border: '#2A2E3B',
};

export const theme = {
  ...MD3DarkTheme,
  dark: true,
  colors: {
    ...MD3DarkTheme.colors,
    primary: colors.accentPrimary,
    onPrimary: '#0F1117',
    primaryContainer: colors.accentPrimary,
    onPrimaryContainer: '#0F1117',
    secondary: colors.accentSecondary,
    onSecondary: '#FFFFFF',
    background: colors.bgPrimary,
    onBackground: colors.textPrimary,
    surface: colors.bgSecondary,
    onSurface: colors.textPrimary,
    surfaceVariant: colors.bgTertiary,
    onSurfaceVariant: colors.textSecondary,
    outline: colors.border,
    error: colors.error,
    onError: '#FFFFFF',
    elevation: {
      level0: 'transparent',
      level1: colors.bgSecondary,
      level2: colors.bgTertiary,
      level3: colors.bgTertiary,
      level4: colors.bgTertiary,
      level5: colors.bgTertiary,
    },
  },
};

export const spacing = {
  xs: 4,
  sm: 8,
  md: 12,
  lg: 16,
  xl: 24,
  xxl: 32,
};
