module Accounts
  module Handlers
    class CreateAccountHandler
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(::Accounts::Account, command.aggregate_id) do |account|
          account.create(email: command.email, password_hash: command.password_hash)
        end
      end
    end

    class CreateAccountJob < EventHandlerJob
      def call(event)
        org_uuid = event.data.fetch(:organization_uuid)
        org = ::Organization.find_by!(uuid: org_uuid)
        acc = ::Account.find_by!(uuid: event.data.fetch(:account_uuid))

        MultiTenantSupport.under_tenant(org) do
          org.accounts << acc
        end
      end
    end
  end
end
