class AddAliveFlagToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :alive, :boolean, default: true
  end
end
