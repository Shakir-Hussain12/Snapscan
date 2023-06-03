class AddCounttoTables < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :games_count, :integer, default: 0
    add_column :users, :categories_count, :integer, default: 0
  end
end
