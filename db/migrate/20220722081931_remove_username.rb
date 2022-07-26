class RemoveUsername < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_name
  end
end
