import { useQuery } from '@tanstack/react-query';
import { automotiveService } from '../services/automotive.service';

export function useManufacturers() {
  return useQuery({
    queryKey: ['manufacturers', 'automotive'],
    queryFn: async () => {
      const data = await automotiveService.getManufacturers();
      console.log('[useManufacturers]', data?.length, 'results');
      return data;
    },
  });
}

export function useManufacturer(slug: string) {
  return useQuery({
    queryKey: ['manufacturer', slug],
    queryFn: () => automotiveService.getManufacturer(slug),
    enabled: !!slug,
  });
}

export function useVehicleModels(manufacturerId: string) {
  return useQuery({
    queryKey: ['models', manufacturerId],
    queryFn: () => automotiveService.getModels(manufacturerId),
    enabled: !!manufacturerId,
  });
}

export function useManufacturerWithModels(slug: string) {
  return useQuery({
    queryKey: ['manufacturer-models', slug],
    queryFn: () => automotiveService.getManufacturerWithModels(slug),
    enabled: !!slug,
  });
}

export function useVehicleYears(modelId: string) {
  return useQuery({
    queryKey: ['years', modelId],
    queryFn: () => automotiveService.getYears(modelId),
    enabled: !!modelId,
  });
}

export function useAutomotiveKeys(yearId: string) {
  return useQuery({
    queryKey: ['keys', yearId],
    queryFn: () => automotiveService.getKeys(yearId),
    enabled: !!yearId,
  });
}

export function useKeyDetail(keyId: string) {
  return useQuery({
    queryKey: ['key', keyId],
    queryFn: () => automotiveService.getKeyDetail(keyId),
    enabled: !!keyId,
  });
}
