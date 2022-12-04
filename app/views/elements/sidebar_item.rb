module Views
  module Elements
    class SidebarItem < Phlex::HTML
      def initialize(text:)
        @text = text
      end
      def template
        li do
          a(href: '#', class: "flex items-center p-2 text-base font-normal rounded-lg dark:text-white hover:bg-gray-100") do
            span(class: "text-gray-900 ml-3") { @text }
          end
        end
      end
    end
  end
end