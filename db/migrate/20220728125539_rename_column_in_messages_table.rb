class RenameColumnInMessagesTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :messages, :sender_id, :user_id
  end
end
