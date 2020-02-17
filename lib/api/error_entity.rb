module Api
  class ErrorEntity < Api::BaseEntity
    expose :error, documentation: { type: String, desc: 'エラーメッセージ' }
  end
end
