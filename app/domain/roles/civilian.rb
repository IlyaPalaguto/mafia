module Roles
  class Civilian < Role

    def move_order
      Constants::MOVE_ORDER[:CIVILIAN]
    end

    def win_condition
      !game_session.players.alive.not_civilians.exists?
    end

    def civilian?; true; end
  end
end
