class CreateTeamPositionPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :team_position_preferences do |t|
      t.references :player, null: false, foreign_key: true
      t.integer :rank, limit: 1
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
