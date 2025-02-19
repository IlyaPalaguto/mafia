class AddStatusToPlayer < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :status, :integer, default: 0
    remove_column :players, :alive, :boolean
  end
end
