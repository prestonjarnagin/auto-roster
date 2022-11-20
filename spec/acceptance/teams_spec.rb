# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/teams', type: :request do
  let(:headers) { { 'Content-Type' => 'application/vnd.api+json' } }

  describe 'GET' do
    describe '/:id' do
      let (:team) { create(:team) }
      let (:team_id) { team.id }

      it 'returns 200 OK' do
        get "/teams/#{team_id}", headers: headers

        expect(response.status).to eq(200)

        response_json = JSON.parse(response.body)
        expect(response_json['id']).to eq(team_id)
      end
    end
  end

  describe 'POST' do
    it 'returns 200 OK' do
      post '/teams', headers: headers,
                     params: {
                       data: {
                         type: 'teams',
                         attributes: {
                           name: 'Big Booty Pitches'
                         }
                       }
                     }.to_json

      expect(response.status).to eq(201)
    end
  end
end
