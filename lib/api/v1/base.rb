require 'grape-swagger'
require 'grape_logging'

module Api
  module V1
    class Base < Grape::API
      api_logger = Logger.new(STDOUT)
      api_logger.formatter = GrapeLogging::Formatters::Default.new
      # FilterParametersはデフォルトでは Rails.application.config.filter_parameters に基づいてパラメータをフィルタします。
      use GrapeLogging::Middleware::RequestLogger,
          logger: api_logger,
          include: [GrapeLogging::Loggers::Response.new,
                    GrapeLogging::Loggers::FilterParameters.new,
                    GrapeLogging::Loggers::ClientEnv.new,
                    GrapeLogging::Loggers::RequestHeaders.new]

      format :json

      # エラーのレスポンス返却では、Grapeの例外は error! が使えます
      # それ以外の例外は rack_response でレスポンスを返してください。

      # ARからの例外
      rescue_from ActiveRecord::RecordNotFound do |e|
        render_api_error! e.message, 404
      end
      # 破壊的メソッドでのバリデーションエラー
      rescue_from ActiveRecord::RecordInvalid do |e|
        render_api_error! e.record.errors, 422
      end

      # Grapeからの例外
      rescue_from Grape::Exceptions::ValidationErrors do |e|
        render_api_error! e, 400
      end
      rescue_from Grape::Exceptions::Base do |e|
        handle_api_exception e
      end

      # 他全ての例外
      rescue_from :all do |e|
        handle_api_exception e
      end

      # Load Helpers
      # アルファベット順に記載してください
      helpers Api::V1::Helpers::ErrorHelpers

      version 'v1', using: :path do
        # Mount API
        # アルファベット順に記載してください
        mount Api::V1::Tests

        # この記述は mount よりも下にしてください。
        add_swagger_documentation(
          add_version: true,
          doc_version: '1.0.0',
          base_path: '/api',
          hide_documentation_path: true,
          format: :json,
          info: {
            title: 'Rails6 Sample APIs'
          }
        )
      end

      # mountにマッチしなければ not found - この記述は必ず mount よりも下にしてください
      route :any, '*path' do
        render_api_error! '404 Not Found.', 404
      end
    end
  end
end
