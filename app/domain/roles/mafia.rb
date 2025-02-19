module Roles
  class Mafia < Role

    def move_order
      Constants::MOVE_ORDER[:MAFIAS]
    end

    def win_condition
      !game_session.players.alive.civilians.exists?
    end

    def mafia?; true; end
  end
end
