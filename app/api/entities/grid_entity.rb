module Entities
  class GridEntity < Grape::Entity
    expose :id, documentation: { type: 'Integer', desc: 'The unique identifier for the grid.' }
    expose :active_on, documentation: { type: 'Date', desc: 'The date the grid is active on.' }
    expose :grid_number, documentation: { type: 'String', desc: 'The grid number.' }
    expose :grid_rows, documentation: { type: 'Integer', desc: 'The number of rows in the grid.' }
    expose :grid_columns, documentation: { type: 'Integer', desc: 'The number of columns in the grid.' }

    expose :grid_tips, using: Entities::GridTipEntity, documentation: { type: 'Array', desc: 'The grid tips.' }
  end
end