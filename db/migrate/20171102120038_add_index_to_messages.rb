class AddIndexToMessages < ActiveRecord::Migration[5.1]
  def change
    add_index :messages, :token, unique: true
  end
end
