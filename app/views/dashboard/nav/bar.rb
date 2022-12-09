module Views::Dashboard::Nav
  class Bar < Views::ApplicationView
    include Views::SVG

    def template
      nav(class: "bg-white border-b border-gray-200 fixed z-30 w-full") do
        div(class: "px-3 py-3 lg:px-5 lg:pl-3") do
          div(class: "flex items-center justify-between") do
            div(class: "flex items-center justify-start") do
              a(href: dashboard_path, class: "text-xl font-bold flex items-center lg:ml-5 w-48") do
                if MultiTenantSupport.current_tenant.logo.present?
                  img(src: MultiTenantSupport.current_tenant.logo, class: "h-6 mr-3 sm:h-9")
                else
                  span(class: "self-center whitespace-nowrap") { MultiTenantSupport.current_tenant.name }
                end
              end

              form(class: "hidden lg:block lg:pl-10 mb-0") do
                label(for: "topbar-search", class: "sr-only")
                div(class: "relative lg:w-64") do
                  div(class: "absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none") do
                    magnifying_glass_icon
                  end

                  input(
                    type: "text",
                    name: "email",
                    id: "topbar-search",
                    class: "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full pl-10 p-2.5",
                    placeholder: "Search"
                  )
                end
              end
            end

            div(class: "flex items-center") do
              ul(
                class: "flex flex-col border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800"
              ) do
                4.times do |i|
                  render(
                    Item.new(href: "#", text: "Item #{i + 1}")
                  )
                end
              end
            end
          end
        end
      end
    end
  end
end
