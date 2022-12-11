module Accounts
  module Events
    class AccountCancelled < Event
      attribute :account_uuid, Types::UUID
      attribute :reason, Types::String
    end
  end
end
