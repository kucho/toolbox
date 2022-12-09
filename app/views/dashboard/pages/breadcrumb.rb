module Views
  module Dashboard
    module Pages
      class Breadcrumb < ApplicationView
        include Views::SVG

        def initialize(breadcrumbs)
          @breadcrumbs = breadcrumbs
        end

        def template
          nav(:class => "flex", :"aria-label" => "Breadcrumb") do
            ol(class: "inline-flex items-center space-x-1 md:space-x-2") do
              li(class: "inline-flex items-center") do
                a(href: dashboard_path, class: "text-gray-700 hover:text-gray-900 inline-flex items-center") do
                  home_icon
                  text("Home")
                end
              end

              last_crumb_index = @breadcrumbs.size - 1

              @breadcrumbs.each_with_index do |breadcrumb, index|
                li do
                  div(class: "flex items-center") do
                    arrow_icon

                    if index == last_crumb_index
                      current_crumb(breadcrumb.name)
                    else
                      regular_crumb(breadcrumb.name, breadcrumb.path)
                    end
                  end
                end
              end
            end
          end
        end

        private

        def current_crumb(name)
          span(:class => "text-gray-400 ml-1 md:ml-2 font-medium", :"aria-current" => "page") do
            name
          end
        end

        def regular_crumb(name, path)
          a(href: path, class: "text-gray-700 hover:text-gray-900 ml-1 md:ml-2 font-medium") { name }
        end
      end
    end
  end
end
