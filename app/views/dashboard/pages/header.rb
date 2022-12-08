module Views
  module Dashboard
    module Pages
      class Header < Views::ApplicationView
        def initialize(title: nil)
          @title = title
        end

        def template(&content)
          div(class: "p-4 bg-white block flex items-center justify-between border-b border-gray-200 lg:mt-1.5") do
            div(class: "mb-1 w-full") do
              render(Views::Dashboard::Pages::Breadcrumb.new(helpers.breadcrumbs))
              h1(class: "text-xl sm:text-2xl font-semibold text-gray-900 mt-4") { @title } if @title
            end

            div(&content) if content.present?
          end
        end
      end
    end
  end
end
