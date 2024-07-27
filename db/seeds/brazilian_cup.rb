def seed_brazilian_cup
  p 'Seeding Brazilian Cup Champions'

  brazilian_cup_champions.each do |champion|
    BrazilianCupChampion.find_or_create_by!(year: champion[:year]) do |brazilian_cup_champion|
      brazilian_cup_champion.champion_key = champion[:champion_key]
      brazilian_cup_champion.vice_key = champion[:vice_key]
    end
  end
end

def brazilian_cup_champions = [
  { "year": 1989, "champion_key": "gremio", "vice_key": "sport" },
  { "year": 1990, "champion_key": "flamengo", "vice_key": "goias" },
  { "year": 1991, "champion_key": "criciuma", "vice_key": "gremio" },
  { "year": 1992, "champion_key": "internacional", "vice_key": "fluminense" },
  { "year": 1993, "champion_key": "cruzeiro", "vice_key": "gremio" },
  { "year": 1994, "champion_key": "gremio", "vice_key": "ceara" },
  { "year": 1995, "champion_key": "corinthians", "vice_key": "gremio" },
  { "year": 1996, "champion_key": "cruzeiro", "vice_key": "palmeiras" },
  { "year": 1997, "champion_key": "gremio", "vice_key": "flamengo" },
  { "year": 1998, "champion_key": "palmeiras", "vice_key": "cruzeiro" },
  { "year": 1999, "champion_key": "juventude", "vice_key": "botafogo" },
  { "year": 2000, "champion_key": "cruzeiro", "vice_key": "sao_paulo" },
  { "year": 2001, "champion_key": "gremio", "vice_key": "corinthians" },
  { "year": 2002, "champion_key": "corinthians", "vice_key": "bragantino" },
  { "year": 2003, "champion_key": "cruzeiro", "vice_key": "flamengo" },
  { "year": 2004, "champion_key": "santo_andre", "vice_key": "vasco" },
  { "year": 2005, "champion_key": "paulista", "vice_key": "fluminense" },
  { "year": 2006, "champion_key": "flamengo", "vice_key": "vasco" },
  { "year": 2007, "champion_key": "fluminense", "vice_key": "figueirense" },
  { "year": 2008, "champion_key": "sport", "vice_key": "coritiba" },
  { "year": 2009, "champion_key": "corinthians", "vice_key": "internacional" },
  { "year": 2010, "champion_key": "santos", "vice_key": "vitoria" },
  { "year": 2011, "champion_key": "vasco", "vice_key": "coritiba" },
  { "year": 2012, "champion_key": "palmeiras", "vice_key": "coritiba" },
  { "year": 2013, "champion_key": "flamengo", "vice_key": "atletico_pr" },
  { "year": 2014, "champion_key": "atletico_mg", "vice_key": "cruzeiro" },
  { "year": 2015, "champion_key": "palmeiras", "vice_key": "santos" },
  { "year": 2016, "champion_key": "gremio", "vice_key": "atletico_mg" },
  { "year": 2017, "champion_key": "cruzeiro", "vice_key": "flamengo" },
  { "year": 2018, "champion_key": "cruzeiro", "vice_key": "corinthians" },
  { "year": 2019, "champion_key": "athletico_pr", "vice_key": "internacional" },
  { "year": 2020, "champion_key": "palmeiras", "vice_key": "gremio" },
  { "year": 2021, "champion_key": "atletico_mg", "vice_key": "atletico_pr" },
  { "year": 2022, "champion_key": "flamengo", "vice_key": "corinthians" },
  { "year": 2023, "champion_key": "sao_paulo", "vice_key": "flamengo" }
]