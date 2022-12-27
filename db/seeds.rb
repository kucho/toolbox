cmd_bus = Rails.configuration.command_bus

cmd_bus.call(
  Organizations::Commands::CreateOrganization.new(
    name: "Toolbox",
    domain: "localhost"
  )
)
org = Organization.find_by!(name: "Toolbox")

MultiTenantSupport.under_tenant(org) do
  RodauthApp.rodauth.create_account(
    login: "test@test.com",
    password: "12345678"
  )
  RodauthApp.rodauth.verify_account(account_login: "test@test.com")

  product_1 = SecureRandom.uuid
  cmd_bus.call(
    ProductCatalog::Commands::RegisterProduct.new(product_uuid: product_1)
  )
  cmd_bus.call(
    ProductCatalog::Commands::NameProduct.new(
      product_uuid: product_1,
      name: "Magic Keyboard 2"
    )
  )

  product_2 = SecureRandom.uuid
  cmd_bus.call(
    ProductCatalog::Commands::RegisterProduct.new(product_uuid: product_2)
  )
  cmd_bus.call(
    ProductCatalog::Commands::NameProduct.new(
      product_uuid: product_2,
      name: "Avast Antivirus"
    )
  )

  cmd_bus.call(
    Inventory::Commands::Supply.new(
      product_uuid: product_1,
      quantity: 3,
      unit_price: 480
    )
  )

  cmd_bus.call(
    Pricing::Commands::SetPrice.new(
      product_uuid: product_1,
      price: 550,
      currency: "PEN"
    )
  )

  cmd_bus.call(
    Inventory::Commands::Supply.new(
      product_uuid: product_2,
      quantity: 2,
      unit_price: 30
    )
  )
  cmd_bus.call(
    Inventory::Commands::Supply.new(
      product_uuid: product_1,
      quantity: 2,
      unit_price: 480
    )
  )
  cmd_bus.call(
    Inventory::Commands::Supply.new(
      product_uuid: product_1,
      quantity: 5,
      unit_price: 420
    )
  )
end

cmd_bus.call(
  Organizations::Commands::CreateOrganization.new(
    name: "Coneable",
    domain: "localhost"
  )
)
coneable_org = Organization.find_by!(name: "Coneable")

MultiTenantSupport.under_tenant(coneable_org) do
  RodauthApp.rodauth.create_account(
    login: "drihu@test.com",
    password: "12345678"
  )
  RodauthApp.rodauth.verify_account(account_login: "drihu@test.com")
end
