module Views
  module Dashboard
    module Teams
      class Index < Views::ApplicationView
        def initialize(teams:)
          @teams = teams
        end

        def template
          render(Pages::Layout.new) do |c|
            c.header(title: "All Teams")

            c.body do
              if @teams.empty?
                p(class: "text-center") { "Create a new team to start!" }
              else
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
  end
end
