module ProductCatalog
  module Commands
    class RegisterProduct < Command
      attribute :product_uuid, Types::UUID.default { SecureRandom.uuid }

      alias aggregate_id product_uuid
    end
  end
end
