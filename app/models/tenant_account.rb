class TenantAccount < ApplicationRecord
  belongs_to :tenant
  belongs_to :account
end
