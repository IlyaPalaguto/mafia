class GameSession < ApplicationRecord
  has_many :players, dependent: :destroy
  accepts_nested_attributes_for :players, allow_destroy: true, reject_if: :all_blank
end
