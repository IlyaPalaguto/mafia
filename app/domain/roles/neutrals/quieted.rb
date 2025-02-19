module Roles
  module Neutrals
    class Quieted < Neutral

      DAYS_WITHOUT_VOTE_REQUIRED = 3

      def move_order
        Constants::MOVE_ORDER[:NEUTRAL_KILLING_ROLES]
      end

      def use_ability(params)
        if kill_actions.pending.exists? && params[:target_id].present?
          action = kill_actions.pending.first
          action.target_id = params[:target_id]
          action.night = active_night

          attempt_to_kill(action)
        end
      end

      def check_ability
        if !game_session.votes.last.vote_candidates.where(candidate: player).exists?
          kill_actions.create
        end
        @check_ability = !shoots_count.zero?

        super
      end

      def shoots_count
        @shoots_count ||= kill_actions.pending.count
      end

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
