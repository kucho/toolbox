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

    events.each { |h| Rails.configuration.event_store.subscribe_to_all_events(h) }
  end

  # Example:
  #       command_bus.register(
  #         AddItemToShipmentPickingList,
  #         OnAddItemToShipmentPickingList.new(event_store)
  #       )
  def configure_bounded_contexts
    [].each { |c| c.call(event_store, command_bus) }
  end

  # Example:
  #        event_store.subscribe(
  #          ConfirmOrderOnPaymentCaptured.new(command_bus),
  #         to: [Payments::PaymentCaptured]
  #       )
  def configure_processes
  end
end
