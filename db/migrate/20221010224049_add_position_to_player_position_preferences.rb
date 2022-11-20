class AddPositionToPlayerPositionPreferences < ActiveRecord::Migration[7.0]
  def change
    add_column :player_position_preferences, :position, :integer
  end
end
