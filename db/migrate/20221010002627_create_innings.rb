class CreateInnings < ActiveRecord::Migration[7.0]
  def change
    create_table :innings, id: :uuid do |t|
      t.uuid :game_id, null: false, foreign_key: true
      t.integer :number
      t.integer :half

      t.timestamps
    end
  end
end
