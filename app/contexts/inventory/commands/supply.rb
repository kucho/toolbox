module Inventory
  module Commands
    class Supply < Command
      attribute :product_uuid, Types::UUID
      attribute :quantity, Types::Coercible::Integer.constrained(gteq: 1)
      attribute :unit_price, Types::Coercible::Float.constrained(gteq: 0.1)

      alias aggregate_id product_uuid
    end
  end
end
