module Accounts
  module Commands
    class VerifyAccount < Command
      attribute :account_uuid, Types::UUID
      attribute :verification_key, Types::String

      alias aggregate_id account_uuid
    end
  end
end
