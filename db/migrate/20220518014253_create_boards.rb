class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.string :content, null: false
      t.integer :answer

      t.timestamps
    end
  end
end
