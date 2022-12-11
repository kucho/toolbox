module Accounts
  module Commands
    class SetupAccountVerification < Command
      attribute :account_uuid, Types::UUID

      alias aggregate_id account_uuid
    end
  end
end
