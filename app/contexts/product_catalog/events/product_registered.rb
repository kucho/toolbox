module ProductCatalog
  module Events
    class ProductRegistered < Event
      attribute :product_uuid, Types::UUID
    end
  end
end
