module Dashboard
  class TeamsController < ApplicationController
    def index
      add_breadcrumb("Teams", request.path)

      render(
        Views::Dashboard::Teams::Index.new(
          teams: Team.all.load_async
        )
      )
    end
  end
end
