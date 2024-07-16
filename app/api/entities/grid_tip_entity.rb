module Entities
  class GridTipEntity < Grape::Entity
    expose :id, documentation: { type: 'Integer', desc: 'The unique identifier for the grid tip.' }
    expose :i, documentation: { type: 'Integer', desc: 'The i coordinate of the grid tip.' }
    expose :j, documentation: { type: 'Integer', desc: 'The j coordinate of the grid tip.' }
    expose :description, documentation: { type: 'String', desc: 'The description of the grid tip.' }
  end
end