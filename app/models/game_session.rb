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
  has_many :votes, dependent: :destroy
  has_many :nights, dependent: :destroy
  has_one  :active_night, -> { where(active: true) }, class_name: "Night"

  accepts_nested_attributes_for :players, allow_destroy: true, reject_if: :all_blank

  serialize :roles, coder: RolesSerializer

  validates :active_night, absence: true

  def deactive_night
    active_night&.update(active: false)
    association(:active_night).reset
  end
end
