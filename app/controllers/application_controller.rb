class ApplicationController < ActionController::Base
  layout false

  # We are fetching the tenant in a middleware now
  skip_before_action :set_current_tenant_account
end
