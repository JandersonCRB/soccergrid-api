require 'rails_helper'

RSpec.describe 'Clubs API', type: :request do
  describe 'GET /clubs' do
    it 'returns a list of clubs' do
      club = create(:club)
      expect_any_instance_of(Clubs::FindAll).to receive(:call).and_return([club])


      get '/api/v1/clubs'

      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)
      # is an array
      expect(body).to be_an_instance_of(Array)
      # has one item
      expect(body.length).to eq(1)
      # has the correct data
      expect(body.first['id']).to eq(club.id)
      expect(body.first['name']).to eq(club.name)
      expect(body.first['club_key']).to eq(club.club_key)
    end
  end
end