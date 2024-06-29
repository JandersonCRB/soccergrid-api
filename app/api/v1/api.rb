# app/api/v1/api.rb
module V1
  class API < Grape::API
    mount V1::ClubsAPI

    desc 'Returns pong if the API is up and running.'
    get :ping do
      { ping: 'pong' }
    end
  end
end