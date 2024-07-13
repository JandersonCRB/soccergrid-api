require 'rails_helper'

RSpec.describe Grids::FindToday do
  subject { described_class.new(params).call }

  let(:params) { {} }

  context 'when grid exists' do
    let!(:grid) { create(:grid, active_on: Date.today) }

    it 'returns the grid' do
      expect(subject).to eq(grid)
    end
  end

  context 'when grid does not exist' do
    it 'raises a NotFoundError' do
      expect { subject }.to raise_error(NotFoundError)
    end
  end

  context 'when grid is not active' do
    let!(:grid) { create(:grid, active_on: Date.today - 1.day) }

    it 'raises a NotFoundError' do
      expect { subject }.to raise_error(NotFoundError)
    end
  end


end