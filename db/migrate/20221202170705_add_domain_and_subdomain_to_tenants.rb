class AddDomainAndSubdomainToTenants < ActiveRecord::Migration[7.0]
  def change
    add_column :tenants, :domain, :string
    add_column :tenants, :subdomain, :string
  end
end
