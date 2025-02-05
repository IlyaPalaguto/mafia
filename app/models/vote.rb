class Vote < ApplicationRecord
  belongs_to :game_session
  has_many :vote_candidates
  has_many :candidates, through: :vote_candidates

  accepts_nested_attributes_for :vote_candidates, reject_if: proc { |attributes| attributes['voter_ids'].all?(&:blank?) }
end
