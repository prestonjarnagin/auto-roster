# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/teams', type: :request do
  let(:team) { FactoryBot.create(:team) }
  let(:team_id) { team.id }

  describe 'POST' do
    it 'returns 200 OK' do
      post "/teams/#{team_id}/players", headers: { 'Content-Type' => 'application/vnd.api+json' },
                       params: {
                       data: {
                         type: 'players',
                         attributes: {
                           name: Faker::Name.name
                         }
                       }
                     }.to_json

      expect(response.status).to eq(201)
    end
  end
end
