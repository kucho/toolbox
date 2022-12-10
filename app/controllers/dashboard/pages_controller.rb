module Dashboard
  class PagesController < ApplicationController
    def dashboard
      render(Dashboard::Views::RootView.new)
    end
  end
end
