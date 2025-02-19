module Roles
  module Civilians
    class Detective < Civilian

      def use_ability(params)
        check_actions = params[:check_target_ids].map { Actions::Check.new target_id: _1, night: active_night }

        actions << check_actions

        result = players.where(id: params[:check_target_ids]).pluck(:role).map(&:new)
      end
    end
  end
end

# Детектив - мирный, ночью указывает в 3 людей, ведущий показывает карточки ролей этих людей. (То есть, он знает кто есть среди них, но не знает кто есть кто).
