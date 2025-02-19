module Roles
  module Constants
    MAFIA_ROLES = [
      Roles::Mafias::Consigliere,
      Roles::Mafias::Seductress,
      Roles::Mafias::Underboss,
      Roles::Mafias::DirtyCop,
      Roles::Mafias::Lobbyist,
      Roles::Mafias::Snitch,
      Roles::Mafias::Lawyer,
      Roles::Mafias::Cappo,
      Roles::Mafias::Boss,
      Roles::Mafias::Bull
    ]

    CIVILIAN_ROLES = [
      Roles::Civilians::Gravedigger,
      Roles::Civilians::Journalist,
      Roles::Civilians::Detective,
      Roles::Civilians::Paranoid,
      Roles::Civilians::Avenger,
      Roles::Civilians::Psychic,
      Roles::Civilians::Sheriff,
      Roles::Civilians::Doctor,
      Roles::Civilians::Priest,
      Roles::Civilians::Judge
    ]

    NEUTRAL_ROLES = [
      Roles::Neutrals::Equaliser,
      Roles::Neutrals::Assassin,
      Roles::Neutrals::Diseased,
      Roles::Neutrals::Lunatic,
      Roles::Neutrals::Outcast,
      Roles::Neutrals::Quieted,
      Roles::Neutrals::Scammer,
      Roles::Neutrals::Vulture,
      Roles::Neutrals::Lovers,
      Roles::Neutrals::Maniac
    ]

    MOVE_ORDER = {
      FIRST:                  1,
      SAVING_ROLES:           2,
      NEUTRAL_KILLING_ROLES:  3,
      CIVILIAN_KILLING_ROLES: 4,
      CIVILIAN:               5,
      NEUTRAL:                6,
      MAFIAS:                 7,
      MAFIA:                  8
    }
  end
end
