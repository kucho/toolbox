module Views
  module Pages
    class Dashboard < Phlex::HTML
      def template
        render(Views::Layouts::Application.new(title: "Dashboard")) do
          h1(class: "text-5xl font-bold text-teal-300 text-center") do
            "THIS IS THE DASHBOARD! STILL A WIP"
          end
        end
      end
    end
  end
end
