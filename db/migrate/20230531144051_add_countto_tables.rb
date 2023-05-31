class AddCounttoTables < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :games_count, :integer, default: 0
    add_column :categories, :games_count, :integer, default: 0
  fault: 
    end
  end
end
