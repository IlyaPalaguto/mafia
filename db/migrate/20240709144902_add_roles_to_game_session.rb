class AddRolesToGameSession < ActiveRecord::Migration[7.1]
  def change
    add_column :game_sessions, :roles, :jsonb
  end
end
