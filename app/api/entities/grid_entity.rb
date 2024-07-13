module Entities
  class GridEntity < Grape::Entity
    expose :id
    expose :active_on
    expose :grid_number
    expose :grid_rows
    expose :grid_columns
  end
end