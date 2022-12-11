org = Organization.create!(name: "Toolbox", domain: "localhost").reload

MultiTenantSupport.under_tenant(org) do
  RodauthApp.rodauth.create_account(login: "test@test.com", password: "12345678")
  RodauthApp.rodauth.verify_account(account_login: "test@test.com")
end

coneable_org = Organization.create!(name: "Coneable", domain: "localhost").reload

MultiTenantSupport.under_tenant(coneable_org) do
  RodauthApp.rodauth.create_account(login: "drihu@test.com", password: "12345678")
  RodauthApp.rodauth.verify_account(account_login: "drihu@test.com")
end
