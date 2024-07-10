class PrepareGameSessionService
  def call(params)
    game_session = GameSession.new(params)
    game_session.roles = select_roles(game_session.players.size)
    assigns_roles_to_players(game_session)

    game_session
  end

  private

  def select_roles(players_count)
    military_roles_count = players_count / 2
    mafia_roles_count = (players_count - military_roles_count) / 2
    neutral_roles_count = players_count - military_roles_count - mafia_roles_count

    roles = []

    roles << Role::Mafia.select_roles(mafia_roles_count)
    roles << Role::Military.select_roles(military_roles_count)
    roles << Role::Neutral.select_roles(neutral_roles_count)

    roles.flatten
  end

  def assigns_roles_to_players(game_session)
    roles = game_session.roles.shuffle
    game_session.players.each { |player| player.role = roles.pop }
  end
end
