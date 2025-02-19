module Roles
  module Mafias
    class Lawyer < Mafia
      def move_order
        Constants::MOVE_ORDER[:MAFIA]
      end

      def wakes_up_at_night?; false; end

    end
  end
end

# Адвокат - мафия, голосуя за мафию на вторичном голосовании, не позволяет вывести игрока из игры. Не может голосовать в себя.
