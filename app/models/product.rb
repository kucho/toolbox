class Product < ApplicationRecord
  belongs_to_tenant :organization

  monetize :price_cents

  class Configuration
    def call
      event_store.subscribe(
        ProductCatalog::Handlers::RegisterProductJob,
        to: [ProductCatalog::Events::ProductRegistered]
      )
      event_store.subscribe(
        ProductCatalog::Handlers::NameProductJob,
        to: [ProductCatalog::Events::ProductNamed]
      )
      event_store.subscribe(
        Pricing::Handlers::SetPriceJob,
        to: [Pricing::Events::PriceSet]
      )
    end

    private

    def event_store
      Rails.configuration.event_store
    end
  end
end
