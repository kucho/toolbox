class Team < ApplicationRecord
  belongs_to_tenant :organization
  has_many :team_accounts
  has_many :accounts, through: :team_accounts
end
