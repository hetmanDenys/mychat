class AddRoomIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :messages, :room, foreign_key: true
  end
end
