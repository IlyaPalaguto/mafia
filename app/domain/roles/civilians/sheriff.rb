module Roles
  module Civilians
    class Sheriff < Civilian
      def move_order
        Constants::MOVE_ORDER[:CIVILIAN_KILLING_ROLES]
      end

      def use_ability(params)
        if params[:kill_target_id].present?
          action = kill_actions.build(target_id: params[:kill_target_id], night: active_night)
          attempt_to_kill(action)

          if action.approved? && action.target.civilian?
            slef_shoot = kill_actions.build(target: player, night: active_night)
            attempt_to_kill(slef_shoot)
          end
        else
          skip_actions.create(night: active_night, status: :approved)
        end

        return nil
      end

    end
  end
end

# Шериф - мирный, ночью МОЖЕТ стрелять, при попадании в мирного умирает не только мирный, но и сам шериф.
