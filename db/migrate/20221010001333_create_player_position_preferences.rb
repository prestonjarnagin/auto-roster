class CreatePlayerPositionPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :player_position_preferences, id: :uuid do |t|
      t.uuid :player_id, null: false, foreign_key: true
      t.integer :rank, limit: 1

      t.timestamps
    end
  end
end
