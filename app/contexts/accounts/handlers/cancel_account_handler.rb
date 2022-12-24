module Accounts
  module Handlers
    class CancelAccountHandler
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(
          ::Accounts::Account,
          command.aggregate_id
        ) { |account| account.cancel(command.reason) }
      end
    end

    class CancelAccountJob < EventHandlerJob
      def call(event)
        account = ::Account.find_by!(uuid: event.data.fetch(:account_uuid))
        account.update!(status: :closed)
      end
    end
  end
end
