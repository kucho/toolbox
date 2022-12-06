module Dashboard
  class PagesController < ApplicationController
    def dashboard
      render(Views::Pages::Dashboard.new)
    end
  end
end
