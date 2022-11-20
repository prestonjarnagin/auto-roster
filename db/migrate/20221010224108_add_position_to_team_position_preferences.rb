class AddPositionToTeamPositionPreferences < ActiveRecord::Migration[7.0]
  def change
    add_column :team_position_preferences, :position, :integer
  end
end
