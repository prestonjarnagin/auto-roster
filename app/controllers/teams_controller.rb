# frozen_string_literal: true

class TeamsController < ApplicationController
  def create
    team = Team.new(name: team_params[:name])

    return head :unprocessable_entity unless team.save

    render json: team.to_json, status: :created
  end

  def show
    team = Team.find_by(id: params[:id])

    return head :not_found unless team

    render json: team.to_json, status: :ok
  end

  private

  def team_params
    {
      name: params.require(:data).require(:attributes).permit(:name)[:name]
    }
  end
end
