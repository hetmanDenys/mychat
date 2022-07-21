class ForUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :numeric, default: ''
    add_column :users, :country, :string, default: ''
  end
end
