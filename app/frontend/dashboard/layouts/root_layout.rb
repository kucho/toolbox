module Dashboard
  module Layouts
    class RootLayout < ApplicationView
      def template(&content)
        render(Shared::Layouts::BaseLayout.new(title: page_title)) do
          render(Components::NavbarComponent.new)
          div(class: "flex overflow-hidden bg-white pt-16") do
            render(Components::SidebarComponent.new)
            div(id: "main-content", class: "h-full w-full bg-gray-50 relative overflow-y-auto lg:ml-64") do
              main(&content)
            end
          end
        end
      end

      def header(**args, &content)
        render(Components::PageHeaderComponent.new(**args)) { yield_content(&content) }
      end

      def body(&content)
        div(&content)
      end

      private

      def page_title
        helpers.breadcrumbs.map(&:name).reverse.append("Toolbox").join(" | ")
      end
    end
  end
end
