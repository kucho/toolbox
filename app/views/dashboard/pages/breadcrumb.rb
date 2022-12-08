module Views
  module Dashboard
    module Pages
      class Breadcrumb < ApplicationView
        def initialize(breadcrumbs)
          @breadcrumbs = breadcrumbs
        end

        def template
          nav(:class => "flex", :"aria-label" => "Breadcrumb") do
            ol(class: "inline-flex items-center space-x-1 md:space-x-2") do
              li(class: "inline-flex items-center") do
                a(href: dashboard_path, class: "text-gray-700 hover:text-gray-900 inline-flex items-center") do
                  svg(class: "w-5 h-5 mr-2.5", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg") do
                    path(
                      d: "M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"
                    )
                  end

                  text("Home")
                end
              end

              last_crumb_index = @breadcrumbs.size - 1

              @breadcrumbs.each_with_index do |breadcrumb, index|
                li do
                  div(class: "flex items-center") do
                    arrow

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

        def arrow
          svg(class: "w-6 h-6 text-gray-400", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg") do
            path(
              :"fill-rule" => "evenodd",
              :d => "M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z",
              :"clip-rule" => "evenodd"
            )
          end
        end

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
