class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false, length: {minimum:5, maximum:30}
  end
end
