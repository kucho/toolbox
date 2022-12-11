module Accounts
  module Commands
    class CancelAccount < Command
      attribute :account_uuid, Types::UUID
      attribute :reason, Types::String

      alias aggregate_id account_uuid
    end
  end
end
