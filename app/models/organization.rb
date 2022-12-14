class Organization < ApplicationRecord
  has_many :organization_accounts
  has_many :accounts, through: :organization_accounts

  before_create :set_slug_and_subdomain

  class Configuration
    def call
      event_store.subscribe(Organizations::Handlers::CreateOrganizationJob, to: [Organizations::Events::OrganizationCreated])
    end

    private

    def event_store
      Rails.configuration.event_store
    end
  end

  private

  def set_slug_and_subdomain
    self.slug ||= name.downcase.underscore
    self.subdomain = slug
  end
end
