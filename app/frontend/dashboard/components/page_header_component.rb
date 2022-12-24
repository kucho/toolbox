module Dashboard
  module Components
    class PageHeaderComponent < ApplicationView
      def initialize(title: nil)
        @title = title
      end

      def template(&content)
        div(
          class:
            "p-4 bg-white block flex items-center justify-between border-b border-gray-200 lg:mt-1.5"
        ) do
          div(class: "mb-1 w-full") do
            render(BreadcrumbComponent.new(helpers.breadcrumbs))
            if @title
              h1(
                class: "text-xl sm:text-2xl font-semibold text-gray-900 mt-4"
              ) { @title }
            end
            yield_content(&content)
          end
        end
      end
    end
  end
end
