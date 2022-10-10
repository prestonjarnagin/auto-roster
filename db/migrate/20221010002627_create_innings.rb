class CreateInnings < ActiveRecord::Migration[7.0]
  def change
    create_table :innings do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :number
      t.enum :half

      t.timestamps
    end
  end
end
