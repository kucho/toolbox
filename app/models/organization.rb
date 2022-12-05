class Organization < ApplicationRecord
  has_many :organization_accounts
  has_many :accounts, through: :organization_accounts

  before_create :set_slug_and_subdomain

  private

  def set_slug_and_subdomain
    self.slug ||= name.downcase.underscore
    self.subdomain = slug
  end
end
