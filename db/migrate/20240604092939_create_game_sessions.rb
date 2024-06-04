class CreateGameSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :game_sessions do |t|
      t.string :title
      t.integer :discussion_time, default: 60

      t.timestamps
    end
  end
end
