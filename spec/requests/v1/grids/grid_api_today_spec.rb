require 'rails_helper'

RSpec.describe 'Grids API', type: :request do
  describe 'GET /grids/today' do
    context 'with a successful request' do
      let!(:grid) {
        create(:grid, active_on: Date.today)
      }

      it 'has successfull status' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'

        expect(response).to have_http_status(:success)
      end

      it 'has the correct id' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['id']).to eq(grid.id)
      end

      it 'has the correct active_on' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['active_on']).to eq(grid.active_on.to_s)
      end

      it 'has the correct grid_number' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['grid_number']).to eq(grid.grid_number)
      end
    end

    context 'when there is no grid today' do
      it 'has not found status' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_raise(NotFoundError)

        get '/api/v1/grids/today'

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end