module Api
  module V1
    module Entities
      class TestsEntity < Api::BaseEntity
        expose :id, documentation: { type: Integer, example: 1 }
        expose :name, documentation: { type: String, example: 'test' }
        expose :response, documentation: { type: String, example: 'pong' }
      end
    end
  end
end
