class AddDomainAndSubdomainToOrganization < ActiveRecord::Migration[7.0]
  def change
    add_column(:organizations, :domain, :string)
    add_column(:organizations, :subdomain, :string)
  end
end
