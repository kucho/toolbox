cmd_bus = Rails.configuration.command_bus

cmd_bus.call(Organizations::Commands::CreateOrganization.new(name: "Toolbox", domain: "localhost"))
org = Organization.find_by!(name: "Toolbox")

MultiTenantSupport.under_tenant(org) do
  RodauthApp.rodauth.create_account(login: "test@test.com", password: "12345678")
  RodauthApp.rodauth.verify_account(account_login: "test@test.com")
end

cmd_bus.call(Organizations::Commands::CreateOrganization.new(name: "Coneable", domain: "localhost"))
coneable_org = Organization.find_by!(name: "Coneable")

MultiTenantSupport.under_tenant(coneable_org) do
  RodauthApp.rodauth.create_account(login: "drihu@test.com", password: "12345678")
  RodauthApp.rodauth.verify_account(account_login: "drihu@test.com")
end
