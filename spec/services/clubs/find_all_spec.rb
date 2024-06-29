require 'rails_helper'

RSpec.describe Clubs::FindAll do
  let(:params) { {} }
  subject { described_class.new(params).call }

  it 'returns a list of clubs' do
    club = create(:club)
    result = subject.to_a
    expect(result).to be_an(Array)
    expect(result).to include(club)
  end

  context 'when there are no clubs' do
    it 'returns an empty array' do
      result = subject.to_a

      expect(result).to be_an(Array)
      expect(result).to be_empty
    end
  end
end