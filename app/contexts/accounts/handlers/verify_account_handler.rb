module Accounts
  module Handlers
    class VerifyAccountHandler
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(
          ::Accounts::Account,
          command.aggregate_id
        ) { |account| account.verify(command.verification_key) }
      end
    end

    class VerifyAccountJob < EventHandlerJob
      def call(event)
        account = ::Account.find_by!(uuid: event.data.fetch(:account_uuid))
        account.update!(status: :verified)
      end
    end
  end
end
