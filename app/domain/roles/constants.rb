module Roles
  module Constants
    MAFIA_ROLES = [
      Roles::Mafias::Cappo,
      Roles::Mafias::Boss,
      Roles::Mafias::Underboss,
      Roles::Mafias::Consigliere,
      Roles::Mafias::Bull,
      Roles::Mafias::Lobbyist,
      Roles::Mafias::Lawyer,
      Roles::Mafias::Seductress,
      Roles::Mafias::Snitch,
      Roles::Mafias::DirtyCop
    ]

    CIVILIAN_ROLES = [
      Roles::Civilians::Doctor,
      Roles::Civilians::Psychic,
      Roles::Civilians::Detective,
      Roles::Civilians::Priest,
      Roles::Civilians::Judge,
      Roles::Civilians::Journalist,
      Roles::Civilians::Paranoid,
      Roles::Civilians::Avenger,
      Roles::Civilians::Sheriff,
      Roles::Civilians::Gravedigger
    ]

    NEUTRAL_ROLES = [
      Roles::Neutrals::Lovers,
      Roles::Neutrals::Assassin,
      Roles::Neutrals::Vulture,
      Roles::Neutrals::Outcast,
      Roles::Neutrals::Diseased,
      Roles::Neutrals::Maniac,
      Roles::Neutrals::Equaliser,
      Roles::Neutrals::Lunatic,
      Roles::Neutrals::Scammer,
      Roles::Neutrals::Quieted
    ]
  end
end
