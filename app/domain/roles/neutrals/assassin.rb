module Roles
  module Neutrals
    class Assassin < Neutral

      ASSASSIN_TARGETS_TO_KILL = 3

      def move_order
        Constants::MOVE_ORDER[:NEUTRAL_KILLING_ROLES]
      end

      def use_ability(params)
        target = players.find(params[:target_id])

        if target.present? && target.role.is_a?(params[:guess].constantize)
          guess_actions.create(target:, status: "approved", night: active_night)

          action = kill_actions.create(target:, night: active_night)
          attempt_to_kill(action)
        else
          guess_actions.create(target:, status: "rejected", night: active_night)
        end

        return nil
      end

      def check_ability
        @check_ability = guess_actions.last.approved?

        super
      end

      def win_condition
        kill_actions.approved.count >= ASSASSIN_TARGETS_TO_KILL
      end
    end
  end
end

# Ассасин - нейтрал, проснувшись ночью знакомства выбирает себе три цели (из числа сторон, не ролей).
# (выбрав трижды мафию должен будет убить трех мафии, выбрал двух мирных и нейтрала должен будет убить двух мирных и одного нейтрала), ночью указывает на игрока, затем на сторону за которую тот играет, указав верно, убивает его, если ошибся, то теряет возможность проверять следующей ночью.
# Побеждает убив все свои цели. (Если игроков стороны выбранной в начале не остаётся, цель смещается на самую многочисленную сторону).
