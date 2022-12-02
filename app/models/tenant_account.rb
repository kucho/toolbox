class TenantAccount < ApplicationRecord
  belongs_to :account
  belongs_to_tenant :tenant
end
