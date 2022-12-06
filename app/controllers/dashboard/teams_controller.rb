module Dashboard
  class TeamsController < ApplicationController
    def index
      render(
        Views::Dashboard::Teams::Index.new(
          teams: Team.all.load_async
        )
      )
    end
  end
end
