module Roles
  module Neutrals
    class Vulture < Neutral

      REQUIRED_POINTS_FOR_VICTORY = 3

      def use_ability(params)
        select_actions.pending.includes(:target).each do |action|
          action.target.alive? ? action.rejected! : action.approved!
        end

        params[:select_target_ids].each do |target_id|
          select_actions.create(target_id:, night: active_night)
        end

        return nil
      end

      def win_condition
        select_actions.approved.count >= REQUIRED_POINTS_FOR_VICTORY
      end
    end
  end
end

# Стервятник - нейтрал, ночью указывает на двух людей, если любой из них умрет до его следующего ночного действия (за эту ночь, и следующий день), стервятнику засчитывается победное очко.
# Побеждает набрав три очка за игру.
