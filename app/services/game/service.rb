module Game
  class Service
    attr_reader :game_session, :players

    def initialize(game_session)
      @game_session = game_session
      @players = game_session.players
    end

    def generate_queue_for(night)
      Operations::GenerateNightQueue.call(players:, night:)
    end

    def select_roles
      Operations::SelectRoles.call(game_session.players)
    end
  end
end
