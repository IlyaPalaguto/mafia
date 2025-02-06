module Role
  module Neutral
    class Quieted
      include Neutral

      DAYS_WITHOUT_VOTE_REQUIRED = 3

      def win_condition
        return false if game_session.votes.count < DAYS_WITHOUT_VOTE_REQUIRED

        recent_votes = game_session.votes.order(created_at: :desc).limit(DAYS_WITHOUT_VOTE_REQUIRED)
        latest_created_at = recent_votes.pluck(:created_at).last

        !recent_votes.joins(:vote_candidates)
                     .where("votes.created_at >= ?", latest_created_at)
                     .where(vote_candidates: { candidate: player })
                     .exists?
      end
    end
  end
end

# Тихоня - нейтрал, если на дневном голосовании в него не поднялось ни одной руки, получает возможность выстрела, выстрелы накапливаются.
# Побеждает если три дня подряд в него не подниматься ни одна рука.
