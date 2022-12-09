module Views
  module Dashboard
    class BaseLayout < Views::ApplicationView
      def initialize(title:)
        @title = title
      end

      def template(&content)
        render(Views::Layouts::Application.new(title: @title)) do
          render(Views::Dashboard::Navbar.new)
          div(class: "flex overflow-hidden bg-white pt-16") do
            render(Views::Dashboard::Sidebar::Bar.new)
            div(id: "main-content", class: "h-full w-full bg-gray-50 relative overflow-y-auto lg:ml-64") do
              main(&content)
            end
          end
        end
      end
    end
  end
end
