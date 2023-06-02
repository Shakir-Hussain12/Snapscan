class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :icon, null: false
      t.string :description, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
