module ProductCatalog
  module Handlers
    class RegisterProduct
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(::ProductCatalog::Product, command.aggregate_id, &:register)
      end
    end

    class RegisterProductJob < EventHandlerJob
      def call(event)
        ::Product.create!(uuid: event.data.fetch(:product_uuid))
      end
    end
  end
end
