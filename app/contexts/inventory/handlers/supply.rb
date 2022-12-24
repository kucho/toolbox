module Inventory
  module Handlers
    class Supply
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(
          ::Inventory::InventoryEntry,
          command.aggregate_id
        ) { |entry| entry.supply(command.quantity, command.unit_price) }
      end
    end

    class StockLevelChanged < EventHandlerJob
      def call(event)
        product = ::Product.find_by!(uuid: event.data.fetch(:product_uuid))
        stock =
          ::ProductStock.find_or_create_by!(
            product: product,
            unit_price: event.data.fetch(:unit_price)
          )
        stock.update!(quantity: event.data.fetch(:stock_level))
      end
    end
  end
end
