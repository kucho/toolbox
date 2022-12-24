MultiTenantSupport.configure do
  model do |config|
    config.tenant_account_class_name = "Organization"
    config.tenant_account_primary_key = :id
  end

  controller do |config|
    config.current_tenant_account_method = :current_tenant_account
  end

  app do |config|
    config.excluded_subdomains = ["www"]
    # TODO: Update the hostname
    config.host = Rails.env.development? ? "localhost" : "UPDATE-YOUR-HOST"
  end

  console { |config| config.allow_read_across_tenant_by_default = true }
end

# Uncomment if you are using sidekiq without ActiveJob
# require 'multi_tenant_support/sidekiq'

# Uncomment if you are using ActiveJob
# require 'multi_tenant_support/active_job'
