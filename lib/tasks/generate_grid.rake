
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
            count = (1..4).to_a.sample
            description = "Possui #{count} ou menos de  Copas do Brasil"
            club_keys = BrazilianCupChampion.select('count(champion_key) as count, champion_key')
                                .having("count(champion_key) <= ?", count)
                                .group(:champion_key)
                                .pluck(:champion_key)
          else
            count = (0..3).to_a.sample
            if count == 0
              description = "Não possui Copas do Brasil"
            else
              description = "Possui #{count} Copas do Brasil"
            end
            club_keys = BrazilianCupChampion.select('count(champion_key) as count, champion_key')
                                            .having("count(champion_key) = ?", count)
                                            .group(:champion_key)
                                            .pluck(:champion_key)
          end

          { description: description, club_keys: club_keys }
        }
      }
    ]
    p tip_possibilities[0][:randomizeFn].call
  end
end