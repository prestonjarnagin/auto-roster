class PlayersController < ApplicationController
  def create
    team = Team.find(params[:team_id])

    head :not_found unless team

    player = Player.new(player_params)
    player.team = team

    head :unprocessable_entity unless player.save

    render json: player.to_json, status: :created
  end

  private

  def player_params
    {
      name: params.require(:data).require(:attributes).permit(:name)
    }
  end
end
