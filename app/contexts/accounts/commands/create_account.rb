module Accounts
  module Commands
    class CreateAccount < Command
      attribute :account_uuid, Types::UUID
      attribute :organization_uuid, Types::UUID
      attribute :email, Types::String
      attribute :password_hash, Types::String

      alias aggregate_id account_uuid
    end
  end
end
