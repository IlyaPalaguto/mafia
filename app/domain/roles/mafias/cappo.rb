module Roles
  module Mafias
    class Cappo < Mafia
      def move_order
        Constants::MOVE_ORDER[:MAFIA]
      end

      def wakes_up_at_night?; false; end

    end
  end
end

# Каппо - мафия, если человек за которого Каппо проголосовал на первичном голосовании попадает на вторичное голосование, независимо от его результата, в конце голосования он погибает.
