module Role
  module Neutral
    class Lunatic
      include Neutral

      REQUIRED_TARGETS = 3

      def win_condition
        Badges::LunaticTag.where(player: game_session.players.dead).count >= REQUIRED_TARGETS
      end
    end
  end
end

# Лунатик - нейтрал, просыпается первым, показывает ведущему роль за которой он будет следить, когда ведущий назовет эту роль может проснуться с этой ролью,  теперь его задача выбить этого игрока. Неважно как этот игрок покинет игру. После устранения цели, выбирает новую цель.
# Побеждает устранив 3 игроков.
