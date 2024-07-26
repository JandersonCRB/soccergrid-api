def seed_club_regions
  p 'Seeding Club Regions'
  club_regions.each_pair do |region, value|
    value.each_pair do |state, clubs|
      clubs.each do |club|
        ClubRegion.find_or_create_by!(club_key: club, state: state, region: region)
      end
    end
  end
end

def club_regions
  {
    "nordeste": {
      "bahia": ["bahia", "vitoria"],
      "ceara": ["fortaleza", "ceara", "ferroviario_ce", "floresta"],
      "maranhao": ["sampaio_correa"],
      "paraiba": ["botafogo_pb"],
      "pernambuco": ["sport", "nautico"],
      "sergipe": ["confianca"],
      "alagoas": ["crb", "csa"],
      "rio_grande_do_norte": ["abc"]
    },
    "centro_oeste": {
      "goias": ["atletico_go", "goias", "vila_nova", "aparecidense"],
      "mato_grosso": ["cuiaba"]
    },
    "sudeste": {
      "minas_gerais": ["atletico_mg", "cruzeiro", "america_mg", "athletic_club", "tombense"],
      "rio_de_janeiro": ["botafogo", "flamengo", "fluminense", "vasco", "volta_redonda"],
      "sao_paulo": ["bragantino", "corinthians", "palmeiras", "sao_paulo", "botafogo_sp", "guarani", "ituano", "mirassol", "novorizontino", "ponte_preta", "santos", "ferroviaria_sp", "sao_bernardo"]
    },
    "sul": {
      "parana": ["athletico_pr", "coritiba", "operario", "londrina"],
      "santa_catarina": ["criciuma", "avai", "brusque", "chapecoense", "figueirense"],
      "rio_grande_do_sul": ["gremio", "internacional", "juventude", "caxias", "sao_jose_rs", "ypiranga_rs"]
    },
    "norte": {
      "amazonas": ["amazonas"],
      "para": ["paysandu", "remo"]
    }
  }
end