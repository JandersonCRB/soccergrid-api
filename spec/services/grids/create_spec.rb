require 'rails_helper'

RSpec.describe Grids::Create do
  let(:params) {
    {
      grid: {
        active_on: Date.today,
        grid_number: 1,
        grid_rows: 3,
        grid_columns: 3,
        tips: [
          { i: 0, description: "Possui mais de 2 copas do Brasil" },
          { i: 1, description: "Possui mais de 2 campeonatos brasileiros" },
          { i: 2, description: "Possui mais de 20 campeonatos estaduais" },
          { j: 0, description: "Possui a cor vermelha no escudo" },
          { j: 1, description: "É da região nordeste" },
          { j: 2, description: "Já disputou o mundial de interclubes" }
        ],
        answers: {
          "0 0" => %w[flamengo athletico_pr],
          "0 1" => %w[sport bahia],
          "0 2" => %w[corinthians sao_paulo],
          "1 0" => %w[fluminense internacional],
          "2 0" => %w[vasco palmeiras],
          "2 1" => %w[botafogo gremio],
          "2 2" => %w[cruzeiro atletico_mg]
        }
      }
    }
  }

  subject { described_class.new(params).call }

  context 'when grid is correct' do
    it 'creates a grid' do
      expect { subject }.to change { Grid.count }.by(1)
    end

    it 'creates grid tips' do
      expect { subject }.to change { GridTip.count }.by(6)
    end

    it 'creates grid answers' do
      expect { subject }.to change { GridAnswer.count }.by(14)
    end
  end

  context 'when grid number already exists' do
    before do
      create(:grid, grid_number: 1)
    end

    it 'raises BadRequestError' do
      expect { subject }.to raise_error(BadRequestError, "Grid number already exists")
    end

    it 'does not create a grid' do
      expect { subject rescue nil }.not_to change { Grid.count }
    end

    it 'does not create grid tips' do
      expect { subject rescue nil }.not_to change { GridTip.count }
    end

    it 'does not create grid answers' do
      expect { subject rescue nil }.not_to change { GridAnswer.count }
    end
  end

  context 'when active on already exists' do
    before do
      create(:grid, active_on: Date.today, grid_number: 999)
    end

    it 'raises BadRequestError' do
      expect { subject }.to raise_error(BadRequestError, "Grid active on already exists")
    end

    it 'does not create a grid' do
      expect { subject rescue nil }.not_to change { Grid.count }
    end

    it 'does not create grid tips' do
      expect { subject rescue nil }.not_to change { GridTip.count }
    end

    it 'does not create grid answers' do
      expect { subject rescue nil }.not_to change { GridAnswer.count }
    end
  end
end