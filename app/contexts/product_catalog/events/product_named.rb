module ProductCatalog
  module Events
    class ProductNamed < Event
      attribute :product_uuid, Types::UUID
      attribute :name, Types::String
    end
  end
end
