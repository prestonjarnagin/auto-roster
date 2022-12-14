class PlayersController < ApplicationController
  def create
    team = Team.find(params[:team_id])

    head :not_found unless team

    players = bulk_create(team)

    render json: players.to_json, status: :created
  end

  def index
    team = Team.find(params[:team_id])

    head :not_found unless team

    players = team.players

    render json: players.to_json, status: :ok
  end

  private

  def bulk_create(team)
    player_datum = data.map do |player_data|
      player_data.require(:attributes).permit(:name).deep_transform_keys(&:underscore)
    end

    created_players = player_datum.map do |player_data|
      player = Player.new(player_data)
      player.team = team
      player
    end


    if created_players.all?(&:valid?)
      created_players.each(&:save)
      return created_players
    else
      head :unprocessable_entity unless player.save
      return false
    end
  end

  def data
    params.require('bulk:data')
  end

  def players_valid?(players)

  end
end
