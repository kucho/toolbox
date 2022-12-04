module Views
  module Elements
    class Navbar < Phlex::HTML
      def template
        nav(class: "bg-gray-900 border-gray-200 px-2 sm:px-4 py-2.5 rounded") do
          div(class: "container flex flex-wrap items-center justify-between mx-auto") do
            a(href: "#", class: "flex items-center") do
              img(src: "https://uploads-ssl.webflow.com/6043ed3109ebdb7c9484f446/6044232a3a9c17d922a2a05a_LOGO%2002-p-500.png", class: "h-6 mr-3 sm:h-9")
              span(class: "self-center text-xl font-semibold whitespace-nowrap dark:text-white") { MultiTenantSupport.current_tenant.name }
            end
            button(
              class: "inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600",
              data: {
                "collapse-toggle": "navbar-default" 
              },
            type: "button",
            ) do
              span(class: "sr-only") { "open main menu" }
            end
            div(class: "hidden w-full md:block md:w-auto", id: "navbar-default") do
              ul(class: "flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700") do
                4.times do |i|
                  render Views::Elements::NavItem
                           .new(href: "#", text: "Item #{i + 1}")
                end
              end
            end
          end
        end
      end
    end
  end
end