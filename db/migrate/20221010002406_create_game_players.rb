class CreateGamePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :game_players, id: :uuid do |t|
      t.uuid :player_id, null: false, foreign_key: true
      t.uuid :game_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
