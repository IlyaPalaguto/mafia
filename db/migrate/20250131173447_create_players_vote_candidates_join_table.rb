class CreatePlayersVoteCandidatesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :players, :vote_candidates do |t|
      # TODO: Add uniq
      t.index [:player_id, :vote_candidate_id]
      # t.index [:vote_candidate_id, :player_id]
    end
  end
end
