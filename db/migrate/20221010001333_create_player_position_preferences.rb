class CreatePlayerPositionPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :player_position_preferences, id: :uuid do |t|
      t.references :player, null: false, foreign_key: true, type: :uuid
      t.integer :rank, limit: 1

      t.timestamps
    end
  end
end
