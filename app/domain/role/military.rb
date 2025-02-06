module Role
  module Military
    extend Role::Selectable
    include Role

    ROLES = [
      Role::Military::Doctor,
      Role::Military::Psychic,
      Role::Military::Detective,
      Role::Military::Priest,
      Role::Military::Judge,
      Role::Military::Journalist,
      Role::Military::Paranoid,
      Role::Military::Avenger,
      Role::Military::Sheriff,
      Role::Military::Gravedigger
    ]

    def win_condition
      game_session.players.alive.all?(&:military?)
    end

    def military?; true; end
  end
end
