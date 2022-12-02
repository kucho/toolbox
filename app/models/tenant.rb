class Tenant < ApplicationRecord
  has_many :tenant_accounts
  has_many :accounts, through: :tenant_accounts
end
