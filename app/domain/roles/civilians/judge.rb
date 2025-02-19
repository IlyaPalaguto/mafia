module Roles
  module Civilians
    class Judge < Civilian
      def use_ability(params)
        select_actions.pending.approved!

        select_actions.create(target_id: params[:select_target_id], night: active_night)

        return nil
      end
    end
  end
end

# Судья - мирный, указывает ночью на игрока, на дневном голосовании без голоса судьи этого игрока выгнать не могут. Не может указывать в себя.
