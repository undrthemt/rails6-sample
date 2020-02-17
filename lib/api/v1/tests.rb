module Api
  module V1
    class Tests < Grape::API
      resource :tests do
        # APIの説明
        desc 'api疎通確認用' do
          detail 'api疎通確認用'
          success Api::V1::Entities::TestsEntity
        end
        # GET /tests
        get do
          h = { id: 1, name: 'test', response: 'pong' }
          present h, with: Api::V1::Entities::TestsEntity
        end
      end
    end
  end
end
