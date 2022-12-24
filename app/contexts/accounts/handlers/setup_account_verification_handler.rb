module Accounts
  module Handlers
    class SetupAccountVerificationHandler
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(
          ::Accounts::Account,
          command.aggregate_id
        ) { |account| account.setup_verification }
      end
    end

    class SetupAccountVerificationJob < EventHandlerJob
      def call(event)
        account = ::Account.find_by!(uuid: event.data.fetch(:account_uuid))
        verification_key = event.data.fetch(:verification_key)
        ds = verify_account_ds(account.id)
        transaction do
          ds.insert({ id: account.id, key: verification_key }) if ds.empty?
        end
      end

      def verify_account_ds(id)
        db[:account_verification_keys].where(id: id)
      end

      def db
        Sequel::DATABASES.first
      end

      def transaction(opts = {}, &block)
        db.transaction(opts, &block)
      end
    end
  end
end
