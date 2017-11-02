class AddTokenToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :token, :string
  end
end
