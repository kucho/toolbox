module Middleware
  class SetTenantMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @req = ActionDispatch::Request.new(env)

      if !@req.subdomains.empty?
        set_current_tenant_account
      end

      @app.call(env)
    end

    private

    def set_current_tenant_account
      tenant_account = find_current_tenant_account
      MultiTenantSupport.set_current_tenant(tenant_account)
      instance_variable_set("@#{MultiTenantSupport.current_tenant_account_method}", tenant_account)
    end

    def find_current_tenant_account
      MultiTenantSupport::FindTenantAccount.call(
        subdomains: @req.subdomains,
        domain: @req.domain
      )
    end
  end
end
