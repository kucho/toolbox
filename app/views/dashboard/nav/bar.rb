module Views::Dashboard::Nav
  class Bar < Phlex::HTML
    def template
      nav(class: "bg-gray-900 border-gray-200 px-2 sm:px-4 py-2.5 rounded") do
        div(class: "container flex flex-wrap items-center justify-between mx-auto") do
          a(href: "#", class: "flex items-center") do
            img(
              src: "https://uploads-ssl.webflow.com/6043ed3109ebdb7c9484f446/6044232a3a9c17d922a2a05a_LOGO%2002-p-500.png",
              class: "h-6 mr-3 sm:h-9"
            )
            span(class: "self-center text-xl font-semibold whitespace-nowrap dark:text-white") { MultiTenantSupport.current_tenant.name }
          end

          div(class: "hidden w-full md:block md:w-auto", id: "navbar-default") do
            ul(
              class: "flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700"
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
