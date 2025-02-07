class AddVotesCountToGameSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :game_sessions, :votes_count, :integer
  end
end
