module ApiV0
  module Entities
    class Order < Entities::Base
      expose :id
      expose :quantity
      expose :total_price
      expose :created_at, format_with: :iso8601
    end
  end
end