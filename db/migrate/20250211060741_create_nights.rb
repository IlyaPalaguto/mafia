class CreateNights < ActiveRecord::Migration[7.1]
  def change
    create_table :nights do |t|
      t.references :game_session, null: false, foreign_key: true
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
