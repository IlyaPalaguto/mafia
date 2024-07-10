class GameSession < ApplicationRecord
  class RolesSerializer
    def self.load(val)
      val.map(&:constantize).map(&:new) if val
    end

    def self.dump(obj)
      obj.map { |r| r.is_a?(Role) ? r.class.name : r.name }
    end
  end

  has_many :players, dependent: :destroy
  accepts_nested_attributes_for :players, allow_destroy: true, reject_if: :all_blank

  serialize :roles, coder: RolesSerializer
end
