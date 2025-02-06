module Role
  module Neutral
    class Vulture
      include Neutral

      REQUIRED_POINTS_FOR_VICTORY = 3

      def win_condition
        Badges::VultureTag.where(player: game_session.players.dead).count >= REQUIRED_POINTS_FOR_VICTORY
      end
    end
  end
end

# Стервятник - нейтрал, ночью указывает на двух людей, если любой из них умрет до его следующего ночного действия (за эту ночь, и следующий день), стервятнику засчитывается победное очко.
# Побеждает набрав три очка за игру.
