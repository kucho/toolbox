module Accounts
  module Events
    class AccountCreated < Event
      attribute :account_uuid, Types::UUID
      attribute :organization_uuid, Types::UUID
      attribute :email, Types::String
      attribute :password_hash, Types::String
    end
  end
end
