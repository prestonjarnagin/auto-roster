# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/teams', type: :request do
  describe 'POST' do
    it 'returns 200 OK' do
      post '/teams', headers: { 'Content-Type' => 'application/vnd.api+json' },
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
