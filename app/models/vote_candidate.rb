class VoteCandidate < ApplicationRecord
  belongs_to :vote
  belongs_to :candidate, class_name: "Player"
  has_and_belongs_to_many :voters, class_name: "Player", join_table: "players_vote_candidates"

  delegate :name, to: :candidate

  scope :with_max_voters, -> {
    max_voters_count_query = joins(:voters)
      .group(:id)
      .select("COUNT(players.id) AS voters_count")
      .to_sql

    joins(:voters)
      .group(:id)
      .having("COUNT(players.id) = (SELECT MAX(voters_count) FROM (#{max_voters_count_query}) AS max_voters_count)")
  }
end
