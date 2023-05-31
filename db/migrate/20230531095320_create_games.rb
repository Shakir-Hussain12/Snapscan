class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name, false
      t.integer :amount, null: false, default: 1
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
