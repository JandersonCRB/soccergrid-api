require 'rails_helper'

RSpec.describe 'API', type: :request do
  describe 'GET /ping' do
    it 'returns pong' do
      get '/api/v1/ping'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq('ping' => 'pong')
    end
  end
end