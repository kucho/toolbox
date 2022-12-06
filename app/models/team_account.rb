class TeamAccount < ApplicationRecord
  belongs_to_tenant :organization
  belongs_to :account
  belongs_to :team
end
