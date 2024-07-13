require 'rails_helper'

RSpec.describe Grids::UserAnswer do
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
      remote_ip: '192.168.0.1'
    }
  end

  subject { described_class.new(params).call }

  context 'when the answer is correct' do
    it 'returns true' do
      expect(subject[:correct]).to be_truthy
    end

    it 'creates a new GridUserAnswer' do
      expect { subject }.to change { GridUserAnswer.count }.by(1)
    end

    it 'creates a new GridUserAnswer with the correct attributes' do
      subject
      grid_user_answer = GridUserAnswer.last
      expect(grid_user_answer.grid_id).to eq(grid.id)
      expect(grid_user_answer.i).to eq(0)
      expect(grid_user_answer.j).to eq(0)
      expect(grid_user_answer.answer).to eq('crb')
      expect(grid_user_answer.remote_ip).to eq('192.168.0.1')
    end
  end

  context 'when the answer is incorrect' do
    before do
      params[:grid_id] = grid.id
      params[:i] = 0
      params[:j] = 0
      params[:answer] = 'bragantino'
    end

    it 'returns false' do
      expect(subject[:correct]).to be_falsey
    end

    it 'creates a new GridUserAnswer' do
      expect { subject }.to change { GridUserAnswer.count }.by(1)
    end

    it 'creates a new GridUserAnswer with the correct attributes' do
      subject
      grid_user_answer = GridUserAnswer.last
      expect(grid_user_answer.grid_id).to eq(grid.id)
      expect(grid_user_answer.i).to eq(0)
      expect(grid_user_answer.j).to eq(0)
      expect(grid_user_answer.answer).to eq('bragantino')
      expect(grid_user_answer.remote_ip).to eq('192.168.0.1')
    end

    it 'does not create a new GridUserAnswer if the answer is repeated' do
      subject
      subject
      expect(GridUserAnswer.count).to eq(1)
    end
  end

  context 'when the answer is incorrect but its a club from other cell' do
    let(:params) do
      {
        grid_id: grid.id,
        i: 0,
        j: 1,
        answer: 'santos'
      }
    end

    it 'returns false' do
      expect(subject[:correct]).to be_falsey
    end
  end

  context 'when grid does not exist' do
    before do
      params[:grid_id] = 0
      params[:i] = 0
      params[:j] = 0
      params[:answer] = 'bragantino'
    end

    it 'raises an error' do
      expect { subject }.to raise_error(NotFoundError)
    end
  end

  context 'when grid i j is out of bounds' do
    before do
      params[:grid_id] = grid.id
      params[:i] = 3
      params[:j] = 3
      params[:answer] = 'bragantino'
    end

    it 'raises an error' do
      expect { subject }.to raise_error(NotFoundError)
    end
  end
end