module Roles
  module Mafias
    class Bull < Mafia
      ABILITY_CHARGES_COUNT = 2

      def move_order
        Constants::MOVE_ORDER[:MAFIA]
      end

      def wakes_up_at_night?
        false
      end

      def use_ability(params)
        action = kill_actions.create(target: params[:kill_target_id], night: active_night, status: :approved)
        action.target.pending!
      end

      def check_ability
        @check_ability = kill_actions.count < ABILITY_CHARGES_COUNT
        super
      end
    end
  end
end

# Бык - мафия, если ночью бык указывает в человека за которого он голосовал на последнем голосовании то выстрел мафии автоматически направляется в эту цель, на такой выстрел неуязвимости цели не работают. У способности 2 заряда.
