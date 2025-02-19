module Game::Operations
  # TODO: Нужно будет убрать лишнюю логику по созданию game_session и назвать сервис SelectRoles
  class PrepareGameSession
    class << self
      def call(params)
        game_session = GameSession.new(params)
        game_session.roles = select_roles(game_session.players.size)
        assigns_roles_to_players(game_session)

        game_session
      end

      private

      def select_roles(players_count)
        civilian_roles_count = players_count / 2
        mafia_roles_count = (players_count - civilian_roles_count) / 2
        neutral_roles_count = players_count - civilian_roles_count - mafia_roles_count

        roles = []

        roles << Roles::Constants::MAFIA_ROLES.sample(mafia_roles_count)
        roles << Roles::Constants::CIVILIAN_ROLES.sample(civilian_roles_count)
        roles << Roles::Constants::NEUTRAL_ROLES.sample(neutral_roles_count)

        roles.flatten
      end

      def assigns_roles_to_players(game_session)
        roles = game_session.roles.shuffle
        game_session.players.first.role = Roles::Neutrals::Assassin
        game_session.players.drop(1).each { |player| player.role = roles.pop }
      end
    end
  end
end
