module Entities
  class ClubEntity < Grape::Entity
    expose :id
    expose :name
    expose :club_key
  end
end