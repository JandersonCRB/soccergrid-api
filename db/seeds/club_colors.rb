def seed_club_colors
  p 'Seeding Club Colors'
  club_colors.each_pair do |key, value|
    club_key = key
    value.each do |color|
      ClubColor.find_or_create_by!(club_key: club_key, color: color)
    end
  end
end


def club_colors
  {
    "athletico_pr": ["red", "black"],
    "atletico_go": ["red", "black", "white"],
    "atletico_mg": ["black", "white"],
    "bahia": ["blue", "red", "white"],
    "botafogo": ["black", "white"],
    "bragantino": ["black", "white"],
    "corinthians": ["black", "white"],
    "criciuma": ["yellow", "black", "white"],
    "cruzeiro": ["blue", "white"],
    "cuiaba": ["green", "yellow"],
    "flamengo": ["red", "black"],
    "fluminense": ["green", "claret", "white"],
    "fortaleza": ["blue", "red", "white"],
    "gremio": ["blue", "black", "white"],
    "internacional": ["red", "white"],
    "juventude": ["green", "white"],
    "palmeiras": ["green", "white"],
    "sao_paulo": ["white", "red", "black"],
    "vasco": ["black", "white"],
    "vitoria": ["red", "black"],
    "amazonas": ["yellow", "black"],
    "america_mg": ["green", "black", "white"],
    "avai": ["blue", "white"],
    "botafogo_sp": ["black", "white", "red"],
    "brusque": ["red", "green", "yellow"],
    "ceara": ["black", "white"],
    "chapecoense": ["green", "white"],
    "coritiba": ["green", "white"],
    "crb": ["red", "white"],
    "goias": ["green", "white"],
    "guarani": ["green", "white"],
    "ituano": ["black", "red"],
    "mirassol": ["yellow", "green"],
    "novorizontino": ["yellow", "black"],
    "operario": ["black", "white"],
    "paysandu": ["blue", "white"],
    "ponte_preta": ["black", "white"],
    "santos": ["black", "white"],
    "sport": ["red", "black"],
    "vila_nova": ["red", "white"],
    "abc": ["black", "white"],
    "aparecidense": ["blue", "yellow"],
    "athletic_club": ["red", "black"],
    "botafogo_pb": ["black", "white"],
    "caxias": ["claret", "blue"],
    "confianca": ["blue", "white"],
    "csa": ["blue", "white"],
    "ferroviaria_sp": ["claret", "white"],
    "ferroviario_ce": ["black", "white"],
    "figueirense": ["black", "white"],
    "floresta": ["green", "white"],
    "londrina": ["blue", "white"],
    "nautico": ["red", "white"],
    "remo": ["blue", "white"],
    "sampaio_correa": ["green", "yellow", "red"],
    "sao_bernardo": ["yellow", "black"],
    "sao_jose_rs": ["blue", "white"],
    "tombense": ["red", "white"],
    "volta_redonda": ["black", "yellow"],
    "ypiranga_rs": ["green", "yellow"]
  }
end