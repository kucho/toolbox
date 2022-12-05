class OrganizationAccount < ApplicationRecord
  belongs_to :account
  belongs_to_tenant :organization
end
