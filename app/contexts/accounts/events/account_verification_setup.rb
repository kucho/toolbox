module Accounts
  module Events
    class AccountVerificationSetup < Event
      attribute :account_uuid, Types::UUID
      attribute :verification_key, Types::String
    end
  end
end
