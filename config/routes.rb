Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  constraints(lambda { MultiTenantSupport.current_tenant.present? }) do
    get("/", to: redirect("/dashboard"))

    namespace("dashboard") do
      get("/", to: "pages#dashboard")

      resources(:teams)
    end
  end

  get("/", to: "pages#landing", as: "default_root")

  mount(RailsEventStore::Browser => "/res")
end
