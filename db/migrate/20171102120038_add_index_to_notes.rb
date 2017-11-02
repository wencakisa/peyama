class AddIndexToNotes < ActiveRecord::Migration[5.1]
  def change
    add_index :notes, :token, unique: true
  end
end
