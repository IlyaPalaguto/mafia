module Roles
  class Neutral < Role
    def move_order
      Constants::MOVE_ORDER[:NEUTRAL]
    end

    def neutral?; true; end
  end
end
