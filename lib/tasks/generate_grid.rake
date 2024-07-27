namespace :grid do
  desc "Randomize tips and print a creatable grid"
  task :create => :environment do
    tip_possibilities = [
      {
        id: 1,
        randomizeFn: lambda {
          signal = %w[mais menos igual].sample
          if signal == 'mais'
            count = (2..4).to_a.sample
            description = "Possui #{count} ou mais Copas do Brasil"
            club_keys = BrazilianCupChampion.select('count(champion_key) as count, champion_key')
                                            .having("count(champion_key) >= ?", count)
                                            .group(:champion_key)
                                            .pluck(:champion_key)
          elsif signal == 'menos'
            zero_cups = Club.where('NOT EXISTS (SELECT 1 FROM brazilian_cup_champions WHERE champion_key = clubs.club_key)').pluck(:club_key)
            count = (1..4).to_a.sample
            description = "Possui #{count} ou menos de  Copas do Brasil"
            club_keys = BrazilianCupChampion.select('count(champion_key) as count, champion_key')
                                            .having("count(champion_key) <= ?", count)
                                            .group(:champion_key)
                                            .pluck(:champion_key)
            club_keys += zero_cups
          else
            count = (0..3).to_a.sample
            zero_cups = Club.where('NOT EXISTS (SELECT 1 FROM brazilian_cup_champions WHERE champion_key = clubs.club_key)').pluck(:club_key)
            if count == 0
              description = "Não possui Copas do Brasil"
              club_keys = zero_cups
            else
              description = "Possui #{count} Copas do Brasil"
              club_keys = BrazilianCupChampion.select('count(champion_key) as count, champion_key')
                                              .having("count(champion_key) = ?", count)
                                              .group(:champion_key)
                                              .pluck(:champion_key)
            end
          end

          { description: description, club_keys: club_keys }
        }
      },
      {
        id: 2,
        randomizeFn: lambda {
          signal = %w[mais menos igual].sample
          if signal == 'mais'
            count = (1..4).to_a.sample
            description = "Possui #{count} ou mais Campeonatos Brasileiros"
            club_keys = BrazilianSerieAChampion.select('count(champion_key) as count, champion_key')
                                               .having("count(champion_key) >= ?", count)
                                               .group(:champion_key)
                                               .pluck(:champion_key)
          elsif signal == 'menos'
            zero_championships = Club.where('NOT EXISTS (SELECT 1 FROM brazilian_serie_a_champions WHERE champion_key = clubs.club_key)').pluck(:club_key)
            count = (1..4).to_a.sample
            description = "Possui #{count} ou menos de  Campeonatos Brasileiros"
            club_keys = BrazilianSerieAChampion.select('count(champion_key) as count, champion_key')
                                               .having("count(champion_key) <= ?", count)
                                               .group(:champion_key)
                                               .pluck(:champion_key)
            club_keys += zero_championships
          else
            count = (0..3).to_a.sample
            zero_championships = Club.where('NOT EXISTS (SELECT 1 FROM brazilian_serie_a_champions WHERE champion_key = clubs.club_key)').pluck(:club_key)
            if count == 0
              description = "Não possui Campeonatos Brasileiros"
              club_keys = zero_championships
            else
              description = "Possui #{count} Campeonatos Brasileiros"
              club_keys = BrazilianSerieAChampion.select('count(champion_key) as count, champion_key')
                                                 .having("count(champion_key) = ?", count)
                                                 .group(:champion_key)
                                                 .pluck(:champion_key)
            end
          end
          { description: description, club_keys: club_keys }
        }
      }
    ]
    p tip_possibilities[0][:randomizeFn].call
    p tip_possibilities[1][:randomizeFn].call
  end
end