module V1
  class ClubsAPI < Grape::API
    resource :clubs do
      desc 'Return list of clubs'
      get do
        clubs = Clubs::FindAll.new(params).call

        present clubs, with: Entities::ClubEntity
      end
    end
  end
end