module ProductCatalog
  module Commands
    class NameProduct < Command
      attribute :product_uuid, Types::UUID
      attribute :name, Types::String

      alias aggregate_id product_uuid
    end
  end
end
