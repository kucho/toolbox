module Dashboard::Components
  class SidebarComponent < ApplicationView
    def template
      aside(
        id: "sidebar",
        class:
          "fixed hidden z-20 h-full top-0 left-0 pt-16 flex lg:flex flex-shrink-0 flex-col w-64 transition-width duration-75",
        "aria-label": "Sidebar"
      ) do
        div(
          class:
            "relative flex-1 flex flex-col min-h-0 border-r border-gray-200 bg-white pt-0"
        ) do
          div(class: "flex-1 flex flex-col pt-5 pb-4 overflow-y-auto") do
            div(class: "flex-1 px-3 bg-white divide-y space-y-1") do
              ul(class: "space-y-2 pb-2") do
                item(text: "Teams", href: dashboard_teams_path)
                7.times { |i| item(text: "Sidebar Item #{i}", href: "#") }
              end
            end
          end
        end
      end

      div(
        class: "bg-gray-900 opacity-50 hidden fixed inset-0 z-10",
        id: "sidebarBackdrop"
      )
    end

    def item(text:, href:)
      li do
        a(
          href: href,
          class:
            "text-base text-gray-900 font-normal rounded-lg flex items-center p-2 hover:bg-gray-100 group"
        ) { span(class: "ml-3") { text } }
      end
    end
  end
end
