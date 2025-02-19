module Roles
  module Neutrals
    class Lunatic < Neutral

      REQUIRED_TARGETS = 3

      def use_ability(params)
        select_actions.create(target: params[:target_id], night: active_night) unless select_actions.pending.exists?

        return nil
      end

      def check_ability
        select_actions.pending.first.target.dead?
        select_actions.pending.update_all(status: :approved)

        @check_ability = !select_actions.pending.exists?

        super
      end

      def win_condition
        select_actions.approved.count >= REQUIRED_TARGETS
      end
    end
  end
end

# Лунатик - нейтрал, просыпается первым, показывает ведущему роль за которой он будет следить, когда ведущий назовет эту роль может проснуться с этой ролью,  теперь его задача выбить этого игрока. Неважно как этот игрок покинет игру. После устранения цели, выбирает новую цель.
# Побеждает устранив 3 игроков.
