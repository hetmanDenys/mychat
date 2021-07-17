class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    change_table :messages do |t|

      t.timestamps
    end
  end
end