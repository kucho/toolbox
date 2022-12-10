module Dashboard
  class TeamsController < ApplicationController
    def index
      add_breadcrumb("Teams", request.path)

      render(
        Dashboard::Views::Teams::IndexView.new(
          teams: Team.all.load_async
        )
      )
    end
  end
end
