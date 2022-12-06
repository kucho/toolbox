module Views
  module Dashboard
    module Teams
      class Index < Views::ApplicationView
        def initialize(teams:)
          @teams = teams
        end

        def template
          render(Layout.new(title: "Teams")) do
            div(class: "flex flex-col") do
              @teams.each do |team|
                p { team.name }
              end
            end
          end
        end
      end
    end
  end
end
