module ProductCatalog
  module Handlers
    class NameProduct
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(::ProductCatalog::Product, command.aggregate_id) do |product|
          product.set_name(command.name)
        end
      end
    end

    class NameProductJob < EventHandlerJob
      def call(event)
        uuid = event.data.fetch(:product_uuid)
        product = ::Product.find_by!(uuid: uuid)
        product.update!(name: event.data.fetch(:name))
      end
    end
  end
end
