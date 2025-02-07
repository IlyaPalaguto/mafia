module Roles
  class Mafia < Role

    def win_condition
      !game_session.players.alive.any?(&:civilian?)
    end

    def mafia?; true; end
  end
end
