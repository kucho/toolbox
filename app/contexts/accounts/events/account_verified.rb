module Accounts
  module Events
    class AccountVerified < Event
      attribute :account_uuid, Types::UUID
      attribute :verification_key, Types::String
    end
  end
end
