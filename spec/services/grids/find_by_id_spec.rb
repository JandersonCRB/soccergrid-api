require 'rails_helper'

RSpec.describe Grids::FindById do
  let!(:grid) { create(:grid) }

  let(:params) {
    {
      grid_id: grid.id
    }
  }
  subject { described_class.new(params).call }

  context 'when grid exists' do

    it 'returns the grid' do
      result = subject
      expect(result).to eq(grid)
    end

    it 'does not raise error' do
      expect { subject }.not_to raise_error
    end
  end

  context 'when grid does not exist' do
    before do
      params[:grid_id] = 0
    end
    it 'raises error' do
      expect { subject }.to raise_error(NotFoundError)
    end
  end
end