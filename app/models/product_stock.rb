class ProductStock < ApplicationRecord
  belongs_to_tenant :organization
  belongs_to :product

  class Configuration
    def call
      event_store.subscribe(
        Inventory::Handlers::StockLevelChanged,
        to: [Inventory::Events::StockLevelChanged]
      )
    end

    private

    def event_store
      Rails.configuration.event_store
    end
  end
end
