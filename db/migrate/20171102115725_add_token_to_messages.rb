class AddTokenToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :token, :string
  end
end
