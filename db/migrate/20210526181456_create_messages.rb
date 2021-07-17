class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false

      t.timestamps
    end
  end
end
