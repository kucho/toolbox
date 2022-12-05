# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

org = Organization.create!(name: "Toolbox", domain: "localhost")
account = Account.create!(email: "test@test.com", password: "12345678", status: :verified)

MultiTenantSupport.under_tenant(org) do
  org.accounts << account
end

coneable_org = Organization.create!(name: "Coneable", domain: "localhost")
coneable_account = Account.create!(email: "drihu@test.com", password: "12345678", status: :verified)

MultiTenantSupport.under_tenant(coneable_org) do
  coneable_org.accounts << coneable_account
end
