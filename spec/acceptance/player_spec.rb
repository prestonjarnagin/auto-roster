# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/teams/:id/players', type: :request do
  let(:team) { FactoryBot.create(:team) }
  let(:team_id) { team.id }

  describe 'POST' do
    context 'when creating a bulk request' do
      it 'returns 200 OK' do
        post "/teams/#{team_id}/players",
             headers: { 'Content-Type' => 'application/vnd.api+json' },
             params: {
               'bulk:data': [
                  {
                    attributes: { name: Faker::Name.name },
                    type: 'players'
                  },
                  {
                    attributes: { name: Faker::Name.name },
                    type: 'players'
                  },
                  {
                    attributes: { name: Faker::Name.name },
                    type: 'players'
                  }
               ]
             }.to_json
        # post "/teams/#{team_id}/players", headers: { 'Content-Type' => 'application/vnd.api+json' },
        #                                   params: { data: [].to_json }

        expect(response.status).to eq(201)
      end
    end
  end
end
