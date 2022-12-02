class Account < ApplicationRecord
  include Rodauth::Rails.model

  enum status: {unverified: 1, verified: 2, closed: 3}

  has_many :tenant_accounts
  has_many :tenants, through: :tenant_accounts
end
