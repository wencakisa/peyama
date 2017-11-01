class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :text
      t.string :token

      t.timestamps
    end

    add_index :notes, :token, unique: true
  end
end
