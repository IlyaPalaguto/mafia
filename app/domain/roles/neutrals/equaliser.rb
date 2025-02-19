module Roles
  module Neutrals
    class Equaliser < Neutral

      EQUALISER_SINGLE_MAFIA = 1

      def move_order
        Constants::MOVE_ORDER[:NEUTRAL_KILLING_ROLES]
      end

      def use_ability(params)
        target = players.find(params[:target])

        if target.present? && target.is_a?(params[:guess].constantize)
          guess_actions.create(target:, status: :approved, night: active_night)

          action = kill_actions.create(target:, night: active_night)
          attempt_to_kill(action)
        else
          guess_actions.create(target:, status: :rejected, night: active_night)
        end

        return nil
      end

      def check_ability
        @check_ability = guess_actions.last.approved?

        super
      end

      def win_condition
        alive_players = players.alive

        if alive_players.mafias.count <= EQUALISER_SINGLE_MAFIA
          alive_players.civilians.count == alive_players.neutrals.count + alive_players.mafias.count
        else
          alive_players.civilians.count == alive_players.mafias.count
        end
      end
    end
  end
end

# Уравнитель - нейтрал, ночью указывает на человека и угадывает его роль, угадав, убивает его. Не угадав теряет действие следующей ночью.
# Побеждает если количество мирных будет равно количеству мафии. Если остаётся только одна мафия, то условие меняется на “мирные = мафия+нейтралы”
