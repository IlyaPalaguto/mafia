module Role
  module Neutral
    class Maniac
      include Neutral

      MIN_PLAYERS_FOR_VICTORY = 3

      def win_condition
        game_session.players.alive.count <= MIN_PLAYERS_FOR_VICTORY
      end
    end
  end
end

# Маньяк - нейтрал, ночью указывает игрока игрока, если роль игрока:
# Мирный - получает двойной голос на голосовании.
# Нейтрал - узнает точную роль своей цели
# Мафия - следующей ночью получает возможность выстрела (нельзя стрелять в того кого он проверял прошлой ночью). Выстрелы не копятся.
# Побеждает оставшись одним из 3 последних игроков.
