module Roles
  module Civilians
    class Doctor < Civilian
      def move_order
        Constants::MOVE_ORDER[:SAVING_ROLES]
      end

      def use_ability(params)
        save_actions.create(target_id: params[:save_target_id], night: active_night)

        return nil
      end

      def check_ability
        @check_ability ||= save_actions.last.target != player

        super
      end
    end
  end
end

# Доктор - мирный, ночью указывает в человека который получит неуязвимость на эту ночь, может указывать в себя, но не больше одного раза подряд.
