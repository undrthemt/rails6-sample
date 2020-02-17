module Api
  module V1
    module Helpers
      module ErrorHelpers
        # 破壊的メソッドを利用しない場合のバリデーションエラーの描画
        def render_validation_error!(model)
          if model.errors.any?
            render_api_error!(model.errors.messages || '422 Unprocessable Entity', 422)
          end
        end

        def render_api_error!(message, status)
          Api::Base.logger.add log_level(status), message

          if self.respond_to?(:rack_response)
            rack_response({ error: message }.to_json, status)
          else
            error!({ error: message }, status)
          end
        end

        def log_level(status)
          case status.to_i
          when 100...399
            Logger::INFO
          when 400...499
            Logger::WARN
          when 500...599
            Logger::FATAL
          else
            Logger::INFO
          end
        end

        # APIの最後の例外ハンドラ
        # 本番ではログ上にはエラーを記録し、レスポンスには情報を返さない。
        def handle_api_exception(exception)
          trace = exception.backtrace

          message = "\n#{exception.class} (#{exception.message}):\n"
          message << exception.annoted_source_code.to_s if exception.respond_to?(:annoted_source_code)
          message << '  ' << trace.join("\n  ")

          Api::Base.logger.add Logger::FATAL, message

          response_message =
            if Rails.env.production?
              '500 Internal Server Error'
            else
              message
            end

          # Rollbar.error(exception)
          render_api_error! response_message, 500
        end
      end
    end
  end
end
