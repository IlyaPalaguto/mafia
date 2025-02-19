module Roles
  module Civilians
    class Priest < Civilian

      def move_order
        Constants::MOVE_ORDER[:SAVING_ROLES]
      end

      def use_ability(params)
        if params[:target_id].present? && check_ability
          save_actions.create(target_id: params[:save_target_id], night: active_night)
          save_actions.create(target: player, night: active_night)
        else
          skip_actions.create(night: active_night, status: :approved)
        end

        return nil
      end

      def check_ability
        @check_ability ||= begin
          return true if game_session.votes_count.zero?

          !game_session.votes.last
                            .vote_candidates
                            .where(candidate: player)
                            .exists?
        end

        super
      end
    end
  end
end

# Священник - мирный, если в него никто не проголосовал днём, получает неуязвимость на ночь и может дать её ещё одному игроку, Если в него проголосует вся оставшаяся в игре мафия, независимо от того кто умрет на голосовании, он умрет, так же умрет не только он, но и последний кому он давал неуязвимость ночью. В начале дня объявляется был ли святой неуязвим прошедшей ночью.
