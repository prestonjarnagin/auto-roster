# frozen_string_literal: true

module Teams
  class FindController < ApplicationController
    def show
      team = Team.find_by(slug: params[:slug])

      head :not_found unless team

      render json: team.to_json, status: :ok
    end
  end
end
