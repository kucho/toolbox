class Account < ApplicationRecord
  include Rodauth::Rails.model

  enum status: { unverified: 1, verified: 2, closed: 3 }

  has_many :organization_accounts
  has_many :organizations, through: :organization_accounts
  has_many :team_accounts
  has_many :teams, through: :team_accounts

  class Configuration
    def call
      event_store.subscribe(
        Accounts::Handlers::CreateAccountJob,
        to: [Accounts::Events::AccountCreated]
      )
      event_store.subscribe(
        Accounts::Handlers::SetupAccountVerificationJob,
        to: [Accounts::Events::AccountVerificationSetup]
      )
      event_store.subscribe(
        Accounts::Handlers::VerifyAccountJob,
        to: [Accounts::Events::AccountVerified]
      )
      event_store.subscribe(
        Accounts::Handlers::CancelAccountJob,
        to: [Accounts::Events::AccountCancelled]
      )
    end

    private

    def event_store
      Rails.configuration.event_store
    end
  end
end
