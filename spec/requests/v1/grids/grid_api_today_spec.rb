require 'rails_helper'

RSpec.describe 'Grids API', type: :request do
  describe 'GET /grids/today' do
    context 'with a successful request' do
      let!(:grid) {
        grid = create(:grid, active_on: Date.today )
        create(:grid_tip, grid: grid, i: 0, j: nil)
        create(:grid_tip, grid: grid, i: 1, j: nil)
        create(:grid_tip, grid: grid, i: 2, j: nil)
        create(:grid_tip, grid: grid, i: nil, j: 0)
        create(:grid_tip, grid: grid, i: nil, j: 1)
        create(:grid_tip, grid: grid, i: nil, j: 2)

        grid
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

      it 'returns a grip_tip object' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['grid_tips']).to be_an(Array)
      end

      it 'has i coordinates' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['grid_tips'].first['i']).to eq(0)
      end

      it 'has j coordinates' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['grid_tips'].first['j']).to eq(nil)
      end

      it 'has description' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['grid_tips'].first['description']).to eq(grid.grid_tips.first[:description])
      end

      it 'has the correct number of rows' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['grid_rows']).to eq(grid.grid_rows)
      end

      it 'has the correct number of columns' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['grid_columns']).to eq(grid.grid_columns)
      end

      it 'has the correct number of grid tips' do
        expect_any_instance_of(Grids::FindToday).to receive(:call).and_return(grid)

        get '/api/v1/grids/today'
        json = JSON.parse(response.body)

        expect(json['grid_tips'].count).to eq(grid.grid_tips.count)
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