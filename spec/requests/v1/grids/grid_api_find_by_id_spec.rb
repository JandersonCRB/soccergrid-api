require 'rails_helper'

RSpec.describe 'Grids API', type: :request do
  describe 'GET /grids/:grid_id' do
    let!(:grid) { create(:grid) }

    context 'when grid exists' do
      it 'has 200 response' do
        get "/api/v1/grids/#{grid.id}"

        expect(response).to have_http_status(:ok)
      end

      it 'returns the grid' do
        get "/api/v1/grids/#{grid.id}"

        json = JSON.parse(response.body)
        expect(json['id']).to eq(grid.id)
      end

      it 'returns the grid with the correct attributes' do
        get "/api/v1/grids/#{grid.id}"

        json = JSON.parse(response.body)
        expect(json['active_on']).to eq(grid.active_on.to_s)
        expect(json['grid_number']).to eq(grid.grid_number)
        expect(json['grid_rows']).to eq(grid.grid_rows)
        expect(json['grid_columns']).to eq(grid.grid_columns)
      end
    end

    context 'when grid does not exist' do
      it 'has 404 response' do
        get '/api/v1/grids/0'

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end