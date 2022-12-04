module Views
  module Elements
    class Sidebar < Phlex::HTML
      def template
        aside(class: "w-64") do
          div(class: "overflow-y-auto py-4 px-3 bg-gray-50 rounded-md") do
            ul(class: "space-y-2") do
              8.times do |i|
                render(Views::Elements::SidebarItem.new(text: "Sidebar Item #{i}"))
              end
            end
          end
        end
      end
    end
  end
end