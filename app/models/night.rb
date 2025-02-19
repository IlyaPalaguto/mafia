class Night < ApplicationRecord
  belongs_to :game_session

  has_many :actions
  has_many :completed_players, through: :actions, source: :actionable, source_type: "Player"

  has_one :mafia_action, class_name: "Action", as: :actionable
end
