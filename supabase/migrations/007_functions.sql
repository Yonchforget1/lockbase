-- Update vote count on posts after vote change
CREATE OR REPLACE FUNCTION update_post_vote_count()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
    IF NEW.votable_type = 'post' THEN
      UPDATE public.posts SET vote_count = (
        SELECT COALESCE(SUM(value), 0) FROM public.votes WHERE votable_type = 'post' AND votable_id = NEW.votable_id
      ) WHERE id = NEW.votable_id;
    ELSIF NEW.votable_type = 'comment' THEN
      UPDATE public.comments SET vote_count = (
        SELECT COALESCE(SUM(value), 0) FROM public.votes WHERE votable_type = 'comment' AND votable_id = NEW.votable_id
      ) WHERE id = NEW.votable_id;
    END IF;
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    IF OLD.votable_type = 'post' THEN
      UPDATE public.posts SET vote_count = (
        SELECT COALESCE(SUM(value), 0) FROM public.votes WHERE votable_type = 'post' AND votable_id = OLD.votable_id
      ) WHERE id = OLD.votable_id;
    ELSIF OLD.votable_type = 'comment' THEN
      UPDATE public.comments SET vote_count = (
        SELECT COALESCE(SUM(value), 0) FROM public.votes WHERE votable_type = 'comment' AND votable_id = OLD.votable_id
      ) WHERE id = OLD.votable_id;
    END IF;
    RETURN OLD;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_vote_change
  AFTER INSERT OR UPDATE OR DELETE ON public.votes
  FOR EACH ROW EXECUTE FUNCTION update_post_vote_count();

-- Update reputation when user gets votes on posts
CREATE OR REPLACE FUNCTION update_user_reputation()
RETURNS TRIGGER AS $$
DECLARE
  post_author_id UUID;
BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
    IF NEW.votable_type = 'post' THEN
      SELECT author_id INTO post_author_id FROM public.posts WHERE id = NEW.votable_id;
      IF post_author_id IS NOT NULL THEN
        UPDATE public.profiles SET reputation = (
          SELECT COALESCE(SUM(v.value), 0)
          FROM public.votes v
          JOIN public.posts p ON v.votable_id = p.id AND v.votable_type = 'post'
          WHERE p.author_id = post_author_id
        ) WHERE id = post_author_id;
      END IF;
    END IF;
    RETURN NEW;
  END IF;
  RETURN OLD;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_vote_reputation
  AFTER INSERT OR UPDATE OR DELETE ON public.votes
  FOR EACH ROW EXECUTE FUNCTION update_user_reputation();
