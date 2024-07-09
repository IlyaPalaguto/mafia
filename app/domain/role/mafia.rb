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
  end
end
