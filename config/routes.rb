Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root("pages#landing")

  get("/dashboard", to: "pages#dashboard", as: :dashboard)

  mount(RailsEventStore::Browser => "/res")
end
