# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/players/:id/position-preferences', type: :request do
  # let(:team) { FactoryBot.create(:team) }
  # let(:team_id) { team.id }

  let(:player) { FactoryBot.create(:player) }
  let(:player_id) { player.id }

  describe 'POST' do
    it 'returns 200 OK' do
      post '/player-position-preferences',
           headers: { 'Content-Type' => 'application/vnd.api+json' },
           params: {
             'player-id' => player.id,
             'preferences' => [
               { position: 'right-center', rank: 2 },
               { position: 'left-center', rank: 1 },
               { position: 'pitcher', rank: 3 }
             ]
        }.to_json

      expect(response.status).to eq(201)
    end
  end
end
