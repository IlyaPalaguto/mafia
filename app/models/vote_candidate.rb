class VoteCandidate < ApplicationRecord
  belongs_to :vote
  belongs_to :candidate, class_name: "Player"
  has_and_belongs_to_many :voters, class_name: "Player", join_table: "players_vote_candidates"

  delegate :name, to: :candidate
end
