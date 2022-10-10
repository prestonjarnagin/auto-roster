class CreateInnings < ActiveRecord::Migration[7.0]
  def change
    create_table :innings, id: :uuid do |t|
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.integer :number
      t.integer :half

      t.timestamps
    end
  end
end
