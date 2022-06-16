class CreateUserChats < ActiveRecord::Migration[6.1]
  def change
    create_table :user_chats do |t|
      t.string :name
      t.boolean :is_private, :default => false

      t.timestamps
    end
  end
end
