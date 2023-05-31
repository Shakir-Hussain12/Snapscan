class CreateGameCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :game_categories do |t|
      t.references :game, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
