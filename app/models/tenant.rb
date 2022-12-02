class Tenant < ApplicationRecord
  has_many :tenant_accounts
  has_many :accounts, through: :tenant_accounts

  before_create :set_slug_and_subdomain

  private

  def set_slug_and_subdomain
    self.slug ||= name.downcase.underscore
    self.subdomain = slug
  end
end
