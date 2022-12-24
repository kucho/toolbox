module Dashboard
  module Components
    class NavbarComponent < ApplicationView
      include Shared::SVGCollection

      def template
        nav(class: "bg-white border-b border-gray-200 fixed z-30 w-full") do
          div(class: "px-3 py-3 lg:px-5 lg:pl-3") do
            div(class: "flex items-center justify-between") do
              div(class: "flex items-center justify-start") do
                a(
                  href: dashboard_path,
                  class: "text-xl font-bold flex items-center lg:ml-5 w-48"
                ) do
                  if MultiTenantSupport.current_tenant.logo.present?
                    img(
                      src: MultiTenantSupport.current_tenant.logo,
                      class: "h-6 mr-3 sm:h-9"
                    )
                  else
                    span(
                      class: "self-center whitespace-nowrap"
                    ) { MultiTenantSupport.current_tenant.name }
                  end
                end

                form(class: "hidden lg:block lg:pl-10 mb-0") do
                  label(for: "topbar-search", class: "sr-only")
                  div(class: "relative lg:w-64") do
                    div(
                      class:
                        "absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                    ) { magnifying_glass_icon }

                    input(
                      type: "text",
                      name: "email",
                      id: "topbar-search",
                      class:
                        "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full pl-10 p-2.5",
                      placeholder: "Search"
                    )
                  end
                end
              end

              div(class: "flex items-center") do
                ul(
                  class:
                    "flex flex-col border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-2 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800"
                ) do
                  li { button(class: item_icon_style) { notification_icon } }

                  li do
                    button(
                      class: item_icon_style,
                      "data-dropdown-toggle": "user-dropdown"
                    ) { user_icon }

                    div(
                      class:
                        "hidden z-10 w-44 bg-white rounded divide-y divide-gray-100 shadow",
                      id: "user-dropdown"
                    ) do
                      a(class: item_dropdown_style, href: "#") do
                        MultiTenantSupport.current_tenant.name
                      end
                      a(class: item_dropdown_style, href: "#") { "Settings" }
                      form(
                        action: helpers.rodauth.logout_url,
                        method: :post,
                        "data-turbo": false
                      ) do |form|
                        button(
                          type: "submit",
                          class: tokens(item_dropdown_style, "w-full")
                        ) { helpers.rodauth.logout_button }
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end

      private

      def item_dropdown_style
        tokens(item_base_styles, "px-3", "py-2")
      end

      def item_icon_style
        tokens(item_base_styles, "p-2", " rounded-lg")
      end

      def item_base_styles
        <<-STYLES.squish
         flex items-center hover:bg-gray-100 group text-base text-gray-900 font-normal
        STYLES
      end
    end
  end
end
