class PrepareGameSessionService
  def call(params)
    game_session = GameSession.new(params)
    # game_session.roles = select_roles(game_session.players.count)
  end

  private

  def select_roles(players_count)
    military_roles_count = players_count / 2
    mafia_roles_count = (players_count - military_roles_count) / 2
    neutral_roles_count = players_count - military_roles_count - mafia_roles_count

    {
      mafia: Role::Mafia.select_roles(mafia_roles_count),
      military: Role::Military.select_roles(military_roles_count),
      neutral: Role::Neutral.select_roles(neutral_roles_count)
    }
  end
end
