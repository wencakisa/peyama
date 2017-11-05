class AddPasswordDigestToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :password_digest, :string
  end
end
