module Views
  module Dashboard
    module Teams
      class Index < Views::ApplicationView
        def initialize(teams:)
          @teams = teams
        end

        def template
          render(Pages::Layout.new) do |c|
            c.header(title: "All Teams") do
              div(class: "block sm:flex items-center md:divide-x md:divide-gray-100") do
                div(class: "flex items-center sm:justify-end w-full") do
                  button(type: "button", class: button_style) do
                    svg(class: "-ml-1 mr-2 h-6 w-6", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg") do
                      path(
                        :"fill-rule" => "evenodd",
                        :d => "M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z",
                        :"clip-rule" => "evenodd"
                      )
                    end

                    text("Add Team")
                  end
                end
              end
            end

            c.body do
              if @teams.empty?
                p(class: "text-center") { "Create a new team to start!" }
              else
                div(class: "flex flex-col") do
                  @teams.each do |team|
                    p { team.name }
                  end
                end
              end
            end
          end
        end

        private

        def button_style
          <<-STYLES.squish
            text-white bg-cyan-600 hover:bg-cyan-700 focus:ring-4 focus:ring-cyan-200 font-medium
            inline-flex items-center rounded-lg text-sm px-3 py-2 text-center sm:ml-auto
          STYLES
        end
      end
    end
  end
end
