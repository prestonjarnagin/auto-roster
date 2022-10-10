class CreateTeamPositionPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :team_position_preferences, id: :uuid do |t|
      t.uuid :player_id, null: false, foreign_key: true
      t.integer :rank, limit: 1
      t.uuid :team_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
