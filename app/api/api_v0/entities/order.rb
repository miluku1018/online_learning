module ApiV0
  module Entities
    class Order < Entities::Base
      expose :quantity
      expose :total_price
    end
  end
end