class CreateActions < ActiveRecord::Migration[7.1]
  def change
    create_table :actions do |t|
      t.references :night, foreign_key: true
      t.references :actionable, null: false, polymorphic: true
      t.references :target, foreign_key: { to_table: :players }
      t.integer :status, default: 0
      t.string :type

      t.timestamps
    end
  end
end
