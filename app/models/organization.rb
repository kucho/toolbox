class Organization < ApplicationRecord
  has_many :organization_accounts
  has_many :accounts, through: :organization_accounts

  class Configuration
    def call
      event_store.subscribe(
        Organizations::Handlers::CreateOrganizationJob,
        to: [Organizations::Events::OrganizationCreated]
      )
    end

    private

    def event_store
      Rails.configuration.event_store
    end
  end
end
