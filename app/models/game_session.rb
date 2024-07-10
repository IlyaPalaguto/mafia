class GameSession < ApplicationRecord
  class RolesSerializer
    def self.load(val)
      Array.wrap(val).map(&:constantize) if val
    end

    def self.dump(obj)
      Array.wrap(obj).map(&:name)
    end
  end

  has_many :players, dependent: :destroy
  accepts_nested_attributes_for :players, allow_destroy: true, reject_if: :all_blank

  serialize :roles, coder: RolesSerializer
end
