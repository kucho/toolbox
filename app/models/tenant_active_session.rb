class TenantActiveSession < ApplicationRecord
  belongs_to_tenant :tenant
  belongs_to :account
end
