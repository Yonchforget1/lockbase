import { useQuery } from '@tanstack/react-query';
import { residentialService } from '../services/residential.service';

export function useResidentialBrands() {
  return useQuery({
    queryKey: ['manufacturers', 'residential'],
    queryFn: residentialService.getBrands,
  });
}

export function useResidentialBrand(slug: string) {
  return useQuery({
    queryKey: ['brand', slug],
    queryFn: () => residentialService.getBrand(slug),
    enabled: !!slug,
  });
}

export function useLocks(manufacturerId: string) {
  return useQuery({
    queryKey: ['locks', manufacturerId],
    queryFn: () => residentialService.getLocks(manufacturerId),
    enabled: !!manufacturerId,
  });
}

export function useLockDetail(lockId: string) {
  return useQuery({
    queryKey: ['lock', lockId],
    queryFn: () => residentialService.getLockDetail(lockId),
    enabled: !!lockId,
  });
}

export function useKeyBlanks(lockId: string) {
  return useQuery({
    queryKey: ['blanks', lockId],
    queryFn: () => residentialService.getBlanks(lockId),
    enabled: !!lockId,
  });
}

export function useBlankDetail(blankId: string) {
  return useQuery({
    queryKey: ['blank', blankId],
    queryFn: () => residentialService.getBlankDetail(blankId),
    enabled: !!blankId,
  });
}
