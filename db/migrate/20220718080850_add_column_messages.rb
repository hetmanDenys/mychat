class AddColumnMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :file, :string, default: ''
  end
end
