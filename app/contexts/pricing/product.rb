module Pricing
  class Product
    include AggregateRoot

    def initialize(uuid)
      @uuid = uuid
    end

    def set_price(price, currency)
      apply Events::PriceSet.new(
              data: {
                product_uuid: @uuid,
                price: price,
                currency: currency.downcase.to_sym
              }
            )
    end

    on Events::PriceSet do |event|
      @price = Money.from_amount(*event.data.fetch_values(:price, :currency))
    end
  end
end
