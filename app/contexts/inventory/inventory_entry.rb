module Inventory
  class InventoryEntry
    include AggregateRoot

    def initialize(uuid)
      @uuid = uuid
      @reserved = 0
    end

    def supply(quantity, cost)
      apply Events::StockLevelChanged.new(
              data: {
                product_uuid: @uuid,
                quantity: quantity,
                unit_price: cost,
                stock_level: (get_stock(cost) || 0) + quantity
              }
            )
    end

    private

    on Events::StockLevelChanged do |event|
      @in_stock ||= {}
      unit_price = event.data.fetch(:unit_price)
      @in_stock[unit_price] = event.data.fetch(:stock_level)
    end

    def get_stock(cost)
      @in_stock ||= {}
      @in_stock[cost]
    end
  end
end
