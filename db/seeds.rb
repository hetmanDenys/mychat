class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    change_table :messages, &:timestamps
  end
end
