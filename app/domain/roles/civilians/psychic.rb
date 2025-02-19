module Roles
  module Civilians
    class Psychic < Civilian
      def use_ability(params)
        target = players.find(params[:check_target_id])

        check_actions.create(target:, night: active_night, status: :approved)

        result = {
          show_target: target.actions.where(night: previous_night).map(&:target)
        }

        return result
      end
    end
  end
end

# Медиум - мирный, ночью указывает на игрока, ведущий показывает ему куда этот игрок указывал прошлой ночью.
