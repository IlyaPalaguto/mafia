module Role
  module Neutral
    class Diseased
      include Neutral

      def win_condition
        game_session.players.alive.includes(:badges).all? { _1.badges.include?(Badges::DiseasedTag) }
      end
    end
  end
end

# Больной - нейтрал, ночью указывает на одного игрока, тем самым заражая его.
# Побеждает если за столом остались только больной и заражённые игроки.
