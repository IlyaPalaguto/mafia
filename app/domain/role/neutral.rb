module Role
  module Neutral
    extend Role::Selectable
    include Role

    ROLES = [
      Role::Neutral::Lovers,
      Role::Neutral::Assassin,
      Role::Neutral::Vulture,
      Role::Neutral::Outcast,
      Role::Neutral::Diseased,
      Role::Neutral::Maniac,
      Role::Neutral::Equaliser,
      Role::Neutral::Lunatic,
      Role::Neutral::Scammer,
      Role::Neutral::Quieted
    ]
  end
end
