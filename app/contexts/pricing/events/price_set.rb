module Pricing
  module Events
    class PriceSet < Event
      attribute :product_uuid, Types::UUID
      attribute :price, Types::Price
      attribute :currency, Types::ALPHA3
    end
  end
end
