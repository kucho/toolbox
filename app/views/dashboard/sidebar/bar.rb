module Views::Dashboard::Sidebar
  class Bar < Views::ApplicationView
    def template
      aside(class: "w-64") do
        div(class: "overflow-y-auto py-4 px-3 bg-gray-50 rounded-md") do
          ul(class: "space-y-2") do
            render(Item.new(text: "Teams", href: dashboard_teams_path))
            7.times do |i|
              render(Item.new(text: "Sidebar Item #{i}", href: "#"))
            end
          end
        end
      end
    end
  end
end
