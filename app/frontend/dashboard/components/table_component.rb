module Dashboard
  module Components
    class TableComponent < ApplicationView
      def initialize(headers:)
        @headers = headers
      end

      def template(&content)
        table(class: "table-fixed min-w-full divide-y divide-gray-200") do
          thead(class: "bg-gray-100") do
            tr do
              th(class: "p-4", scope: "col") do
                div(class: "flex items-center") do
                  input(
                    :id => "checkbox-all",
                    :type => "checkbox",
                    :"aria-describedby" => "checkbox-1",
                    :class => "bg-gray-50 border-gray-300 focus:ring-3 focus:ring-cyan-200 h-4 w-4 rounded"
                  )
                  label(for: "checkbox-all", class: "sr-only") { "checkbox" }
                end
              end

              @headers.each do |column_title|
                th(class: "p-4 text-left text-xs font-medium text-gray-500 uppercase", scope: "col") do
                  column_title
                end
              end

              tbody(class: "bg-white divide-y divide-gray-200", &content)
            end
          end
        end
      end

      def row(&content)
        tr(class: "hover:bg-gray-100", &content)
      end

      def cell(&content)
        td(class: "p-4 whitespace-nowrap text-base font-medium text-gray-900", &content)
      end

      def action_cell(&content)
        td(class: "p-4 whitespace-nowrap space-x-2", &content)
      end

      def checkbox(id:)
        checkbox_id = "checkbox-#{id}"

        td(class: "p-4 w-4") do
          div(class: "flex items-center") do
            input(
              :id => checkbox_id,
              :type => "checkbox",
              :"aria-describedby" => checkbox_id,
              :class => "bg-gray-50 border-gray-300 focus:ring-3 focus:ring-cyan-200 h-4 w-4 rounded"
            )
            label(for: checkbox_id, class: "sr-only") { "checkbox" }
          end
        end
      end
    end
  end
end
