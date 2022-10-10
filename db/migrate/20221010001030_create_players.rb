class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players, id: :uuid do |t|
      t.uuid :team_id, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
