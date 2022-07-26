class AddUsername < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_name, :string, default: ''
    add_index :users, :user_name
  end
end
