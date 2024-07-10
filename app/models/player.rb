class Player < ApplicationRecord
  class RoleSerializer
    def self.load(val)
      val&.constantize
    end

    def self.dump(obj)
      obj.name
    end
  end
  belongs_to :game_session

  serialize :role, coder: RoleSerializer
end
