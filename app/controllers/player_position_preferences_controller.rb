class PlayerPositionPreferencesController < ApplicationController
  def create
    player = Player.find_by(id: player_id)

    head :not_found unless player

    positions = position_preferences.map do |preference|
      pref = preference.to_h.symbolize_keys
      position = pref[:position].underscore
      rank = pref[:rank]

      PlayerPositionPreference.new(
        player: player, rank: rank, position: position
      )
    end

    if positions.all?(&:valid?)
      saved = positions.map(&:save)
      render json: saved.to_json, status: :created
    else
      head :unprocessable_entity
    end
  end

  private

  def player_position_preferences_params
    params.deep_transform_keys!(&:underscore)
          .permit(:player_id, preferences: %i[position rank])
  end

  def player_id
    player_position_preferences_params[:player_id]
  end

  def position_preferences
    player_position_preferences_params[:preferences]
  end
end
