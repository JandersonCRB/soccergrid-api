module Entities
  class GridEntity < Grape::Entity
    expose :id
    expose :active_on
    expose :grid_number
  end
end