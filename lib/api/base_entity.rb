module Api
  class BaseEntity < Grape::Entity
    format_with(:iso_timestamp) { |dt| dt&.iso8601 }
  end
end
