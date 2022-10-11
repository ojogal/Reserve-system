class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :tables do |t|
      t.string :table
      t.integer :seats
      t.boolean :reserve, default: false
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
