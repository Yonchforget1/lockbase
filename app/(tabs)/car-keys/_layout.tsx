import { Stack } from 'expo-router';
import { colors } from '../../../src/lib/theme';

export default function CarKeysLayout() {
  return (
    <Stack
      screenOptions={{
        headerShown: false,
        contentStyle: { backgroundColor: colors.bgPrimary },
        animation: 'slide_from_right',
      }}
    />
  );
}
