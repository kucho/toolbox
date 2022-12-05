class OrganizationActiveSession < ApplicationRecord
  belongs_to_tenant :organization
  belongs_to :account
end
