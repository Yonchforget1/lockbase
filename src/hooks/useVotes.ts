import { useState, useCallback } from 'react';
import { votesService } from '../services/votes.service';

export function useVote(
  userId: string | undefined,
  votableType: 'post' | 'comment',
  votableId: string,
  initialVoteCount: number,
  initialUserVote: number = 0
) {
  const [voteCount, setVoteCount] = useState(initialVoteCount);
  const [userVote, setUserVote] = useState(initialUserVote);
  const [loading, setLoading] = useState(false);

  const vote = useCallback(
    async (value: 1 | -1) => {
      if (!userId || loading) return;
      setLoading(true);

      const prevCount = voteCount;
      const prevVote = userVote;

      // Optimistic update
      if (userVote === value) {
        setVoteCount((c) => c - value);
        setUserVote(0);
      } else {
        setVoteCount((c) => c - userVote + value);
        setUserVote(value);
      }

      try {
        await votesService.vote(userId, votableType, votableId, value);
      } catch {
        setVoteCount(prevCount);
        setUserVote(prevVote);
      } finally {
        setLoading(false);
      }
    },
    [userId, votableType, votableId, voteCount, userVote, loading]
  );

  return { voteCount, userVote, vote, loading };
}
