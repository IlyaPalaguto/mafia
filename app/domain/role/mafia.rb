module Role
  module Mafia
    extend Role::Selectable
    include Role

    ROLES = [
      Role::Mafia::Cappo,
      Role::Mafia::Boss,
      Role::Mafia::Underboss,
      Role::Mafia::Consigliere,
      Role::Mafia::Bull,
      Role::Mafia::Lobbyist,
      Role::Mafia::Lawyer,
      Role::Mafia::Seductress,
      Role::Mafia::Snitch,
      Role::Mafia::DirtyCop
    ]

    def win_condition
      !game_session.players.alive.any?(&:military?)
    end

    def mafia?; true; end
  end
end
