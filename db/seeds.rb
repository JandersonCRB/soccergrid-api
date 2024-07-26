# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require './db/seeds/brazilian_serie_a'
require './db/seeds/club_colors'
require './db/seeds/club_regions'

# Serie A
clubs = [
  { name: "Athletico-PR", club_key: "athletico_pr" },
  { name: "Atlético-GO", club_key: "atletico_go" },
  { name: "Atlético-MG", club_key: "atletico_mg" },
  { name: "Bahia", club_key: "bahia" },
  { name: "Botafogo", club_key: "botafogo" },
  { name: "Bragantino", club_key: "bragantino" },
  { name: "Corinthians", club_key: "corinthians" },
  { name: "Criciúma", club_key: "criciuma" },
  { name: "Cruzeiro", club_key: "cruzeiro" },
  { name: "Cuiabá", club_key: "cuiaba" },
  { name: "Flamengo", club_key: "flamengo" },
  { name: "Fluminense", club_key: "fluminense" },
  { name: "Fortaleza", club_key: "fortaleza" },
  { name: "Grêmio", club_key: "gremio" },
  { name: "Internacional", club_key: "internacional" },
  { name: "Juventude", club_key: "juventude" },
  { name: "Palmeiras", club_key: "palmeiras" },
  { name: "São Paulo", club_key: "sao_paulo" },
  { name: "Vasco", club_key: "vasco" },
  { name: "Vitória", club_key: "vitoria" },
]

# Serie B
clubs += [
  { name: "Amazonas", club_key: "amazonas" },
  { name: "América-MG", club_key: "america_mg" },
  { name: "Avaí", club_key: "avai" },
  { name: "Botafogo-SP", club_key: "botafogo_sp" },
  { name: "Brusque", club_key: "brusque" },
  { name: "Ceará", club_key: "ceara" },
  { name: "Chapecoense", club_key: "chapecoense" },
  { name: "Coritiba", club_key: "coritiba" },
  { name: "CRB", club_key: "crb" },
  { name: "Goiás", club_key: "goias" },
  { name: "Guarani", club_key: "guarani" },
  { name: "Ituano", club_key: "ituano" },
  { name: "Mirassol", club_key: "mirassol" },
  { name: "Novorizontino", club_key: "novorizontino" },
  { name: "Operário", club_key: "operario" },
  { name: "Paysandu", club_key: "paysandu" },
  { name: "Ponte Preta", club_key: "ponte_preta" },
  { name: "Santos", club_key: "santos" },
  { name: "Sport", club_key: "sport" },
  { name: "Vila Nova", club_key: "vila_nova" },
]

# Serie C
clubs += [
  { name: "ABC", club_key: "abc" },
  { name: "Aparecidense", club_key: "aparecidense" },
  { name: "Athletic Club", club_key: "athletic_club" },
  { name: "Botafogo-PB", club_key: "botafogo_pb" },
  { name: "Caxias", club_key: "caxias" },
  { name: "Confiança", club_key: "confianca" },
  { name: "CSA", club_key: "csa" },
  { name: "Ferroviária-SP", club_key: "ferroviaria_sp" },
  { name: "Ferroviário-CE", club_key: "ferroviario_ce" },
  { name: "Figueirense", club_key: "figueirense" },
  { name: "Floresta", club_key: "floresta" },
  { name: "Londrina", club_key: "londrina" },
  { name: "Náutico", club_key: "nautico" },
  { name: "Remo", club_key: "remo" },
  { name: "Sampaio Corrêa", club_key: "sampaio_correa" },
  { name: "São Bernardo", club_key: "sao_bernardo" },
  { name: "São José-RS", club_key: "sao_jose_rs" },
  { name: "Tombense", club_key: "tombense" },
  { name: "Volta Redonda", club_key: "volta_redonda" },
  { name: "Ypiranga-RS", club_key: "ypiranga_rs" },
]

clubs.each do |club|
  Club.find_or_create_by!(club)
end

dates = Date.today .. (Date.today + 365)

dates.each do |date|
  grid_create_params = {
    grid: {
      active_on: date,
      grid_number: (Grid.last.grid_number + 1) || 1,
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

  unless Grid.exists?(active_on: date)
    Grids::Create.new(grid_create_params).call
  end
end

seed_serie_a_champions
seed_club_colors
seed_club_regions