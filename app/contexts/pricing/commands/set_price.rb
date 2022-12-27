module Pricing
  module Commands
    class SetPrice < Command
      attribute :product_uuid, Types::UUID
      attribute :price, Types::Price
      attribute :currency, Types::ALPHA3

      alias aggregate_id product_uuid
    end
  end
end
