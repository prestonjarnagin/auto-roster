# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/teams/find', type: :request do
  let(:headers) { { 'Content-Type' => 'application/vnd.api+json' } }
  let(:team)    { create(:team) }
  let(:team_id) { team.id }

  describe 'GET' do
    it 'returns 200 OK' do
      body = { slug: team.slug }

      get "/teams/find/#{team.slug}", headers: headers, params: body

      expect(response.status).to eq(200)

      response_json = JSON.parse(response.body)
      expect(response_json['id']).to eq(team_id)
    end
  end
end
