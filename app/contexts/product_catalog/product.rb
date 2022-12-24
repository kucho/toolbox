module ProductCatalog
  AlreadyRegistered = Class.new(StandardError)

  class Product
    include AggregateRoot

    def initialize(uuid)
      @uuid = uuid
    end

    def register
      raise AlreadyRegistered unless all_events_from_stream.empty?

      apply(Events::ProductRegistered.new(data: { product_uuid: @uuid }))
    end

    def set_name(name)
      apply(Events::ProductNamed.new(data: { product_uuid: @uuid, name: name }))
    end

    on(Events::ProductRegistered) { |_event| }

    on(Events::ProductNamed) { |event| @name = event.data.fetch(:name) }

    private

    def all_events_from_stream
      event_store.read.stream("ProductCatalog::Product$#{@uuid}").to_a
    end

    def event_store
      @event_store ||= Rails.configuration.event_store
    end
  end
end
