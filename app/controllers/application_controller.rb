class ApplicationController < ActionController::Base
  layout false

  # We are fetching the tenant in a middleware now
  skip_before_action :set_current_tenant_account

  helper_method :breadcrumbs

  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name:, path:)
  end
end
