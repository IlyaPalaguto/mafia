class Player < ApplicationRecord
  class RoleSerializer
    def self.load(val)
      val&.constantize
    end

    def self.dump(obj)
      obj.name
    end
  end

  scope :alive, -> { where(alive: true) }
  scope :dead, -> { where(alive: false) }

  belongs_to :game_session
  has_and_belongs_to_many :voted_candidates, class_name: "VoteCandidate", join_table: "players_vote_candidates"

  serialize :role, coder: RoleSerializer

  delegate :civilian?, :mafia?, :neutral?, to: :role

  def role
    super&.new(game_session:, player: self)
  end
end
