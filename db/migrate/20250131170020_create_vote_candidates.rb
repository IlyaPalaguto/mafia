class CreateVoteCandidates < ActiveRecord::Migration[7.1]
  def change
    create_table :vote_candidates do |t|
      t.references :vote, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end
