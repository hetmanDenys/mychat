class AddBirthday < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthday, :datetime, default: ''
  end
end
