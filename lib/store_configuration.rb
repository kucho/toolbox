class StoreConfiguration
  def call
    enable_res_infra_event_linking
    configure_bounded_contexts
    configure_processes
  end

  private

  def enable_res_infra_event_linking
    events = [
      RailsEventStore::LinkByEventType.new,
      RailsEventStore::LinkByCorrelationId.new,
      RailsEventStore::LinkByCausationId.new
    ]

    events.each do |h|
      Rails.configuration.event_store.subscribe_to_all_events(h)
    end
  end

  def configure_bounded_contexts
    [
      Accounts::Configuration.new,
      Organizations::Configuration.new,
      ProductCatalog::Configuration.new,
      Inventory::Configuration.new,
      Pricing::Configuration.new
    ].each { |c| c.call }
  end

  # Example:
  #        event_store.subscribe(
  #          ConfirmOrderOnPaymentCaptured.new(command_bus),
  #         to: [Payments::PaymentCaptured]
  #       )
  def configure_processes
    Account::Configuration.new.call
    Organization::Configuration.new.call
    Product::Configuration.new.call
    ProductStock::Configuration.new.call
  end
end
