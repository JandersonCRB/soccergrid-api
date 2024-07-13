module Entities
  class UserAnswerResponseEntity < Grape::Entity
    expose :correct, documentation: { type: 'Boolean', desc: 'Whether the answer is correct or not' }
  end
end