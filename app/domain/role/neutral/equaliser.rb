module Role
  module Neutral
    class Equaliser
      include Neutral

      EQUALISER_SINGLE_MAFIA = 1

      def win_condition
        alive_players = game_session.players.alive

        if alive_players.select(&:mafia?).size <= EQUALISER_SINGLE_MAFIA
          alive_players.select(&:military?).size ==
            (alive_players.select(&:neutral) + alive_players.select(&:mafia?).size)
        else
          alive_players.select(&:military?).size == alive_players.select(&:mafia?).size
        end
      end
    end
  end
end

# Уравнитель - нейтрал, ночью указывает на человека и угадывает его роль, угадав, убивает его. Не угадав теряет действие следующей ночью.
# Побеждает если количество мирных будет равно количеству мафии. Если остаётся только одна мафия, то условие меняется на “мирные = мафия+нейтралы”
