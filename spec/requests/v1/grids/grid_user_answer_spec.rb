require 'rails_helper'

RSpec.describe 'Grids API', type: :request do
  describe 'POST /grids/:id/' do
    let!(:grid) { create(:grid, grid_rows: 3, grid_columns: 3) }
    let!(:grid_answers) {
      [
        create(:grid_answer, grid: grid, i: 0, j: 0, club_key: "crb"),
        create(:grid_answer, grid: grid, i: 0, j: 0, club_key: "vasco"),
        create(:grid_answer, grid: grid, i: 0, j: 1, club_key: "internacional"),
        create(:grid_answer, grid: grid, i: 0, j: 1, club_key: "sport"),
        create(:grid_answer, grid: grid, i: 0, j: 2, club_key: "flamengo"),
        create(:grid_answer, grid: grid, i: 1, j: 0, club_key: "fluminense"),
        create(:grid_answer, grid: grid, i: 1, j: 1, club_key: "gremio"),
        create(:grid_answer, grid: grid, i: 1, j: 2, club_key: "palmeiras"),
        create(:grid_answer, grid: grid, i: 2, j: 0, club_key: "botafogo"),
        create(:grid_answer, grid: grid, i: 2, j: 1, club_key: "corinthians"),
        create(:grid_answer, grid: grid, i: 2, j: 2, club_key: "santos"),
      ]
    }
    let(:params) do
      {
        grid_id: grid.id,
        i: 0,
        j: 0,
        answer: "crb",
      }
    end
    context 'with a successful request' do
      it 'has successfull status' do
        expect_any_instance_of(Grids::UserAnswer).to receive(:call).and_return({ correct: true })
        post "/api/v1/grids/#{grid.id}/user_answer", params: params
        expect(response).to have_http_status(:ok)
      end
      it 'has the correct response' do
        expect_any_instance_of(Grids::UserAnswer).to receive(:call).and_return({ correct: true })
        post "/api/v1/grids/#{grid.id}/user_answer", params: params
        json = JSON.parse(response.body)
        expect(json['correct']).to eq(true)
      end
    end

    context 'with an incorrect response' do

      it 'has the ok status' do
        expect_any_instance_of(Grids::UserAnswer).to receive(:call).and_return({ correct: false })
        post "/api/v1/grids/#{grid.id}/user_answer", params: params
        expect(response).to have_http_status(:ok)
      end

      it 'has the correct response' do
        expect_any_instance_of(Grids::UserAnswer).to receive(:call).and_return({ correct: false })
        post "/api/v1/grids/#{grid.id}/user_answer", params: params
        json = JSON.parse(response.body)
        expect(json['correct']).to eq(false)
      end
    end

    context 'when the grid is not found' do
      it 'has not found status' do
        expect_any_instance_of(Grids::UserAnswer).to receive(:call).and_raise(NotFoundError.new("Grid not found"))
        post "/api/v1/grids/#{grid.id}/user_answer", params: params
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when the cell is out of bounds' do
      it 'has not found status' do
        params[:i] = 5
        expect_any_instance_of(Grids::UserAnswer).to receive(:call).and_raise(NotFoundError.new("Cell out of bounds"))
        post "/api/v1/grids/#{grid.id}/user_answer", params: params
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end