module Pricing
  module Handlers
    class SetPrice
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(
          ::Pricing::Product,
          command.aggregate_id
        ) { |product| product.set_price(command.price, command.currency) }
      end
    end

    class SetPriceJob < EventHandlerJob
      def call(event)
        product = ::Product.find_by!(uuid: event.data.fetch(:product_uuid))
        product.update!(
          price: Money.from_amount(*event.data.fetch_values(:price, :currency))
        )
      end
    end
  end
end
