module Roles
  class Civilian < Role

    def win_condition
      game_session.players.alive.all?(&:civilian?)
    end

    def civilian?; true; end
  end
end
