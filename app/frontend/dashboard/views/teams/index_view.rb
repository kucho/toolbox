module Dashboard
  module Views
    module Teams
      class IndexView < ApplicationView
        include Shared::SVGCollection

        def initialize(teams:)
          @teams = teams
        end

        def template
          render(Layouts::RootLayout.new) do |c|
            c.header(title: "All Teams") do
              div(class: "block sm:flex items-center md:divide-x md:divide-gray-100") do
                div(class: "flex items-center sm:justify-end w-full") do
                  button(:type => "button", :class => button_style, :"data-modal-toggle" => "add-team-modal") do
                    plus_icon
                    text("Add Team")
                  end
                end
              end
            end

            c.body do
              render(Components::ModalComponent.new(id: "add-team-modal")) do |m|
                m.header do
                  h3(class: "text-xl font-semibold") { "Add Team" }
                end

                m.body do
                  form(action: "#") do |f|
                    div(class: "grid grid-cols-6 gap-6") do
                      div(class: "col-span-6 sm:col-span-3") do
                        f.label(for: "name", class: "text-sm font-medium text-gray-900 block mb-2") { "Name" }
                        f.input(
                          type: "text",
                          name: "name",
                          id: "team-name",
                          class: "shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-2.5",
                          placeholder: "Accounting",
                          required: true
                        )
                      end
                    end
                  end
                end

                m.footer do
                  button(
                    class: "text-white bg-cyan-600 hover:bg-cyan-700 focus:ring-4 focus:ring-cyan-200 font-medium rounded-lg text-sm px-5 py-2.5 text-center",
                    type: "submit"
                  ) do
                    "Add Team"
                  end
                end
              end

              if @teams.empty?
                p(class: "text-center") { "Create a new team to start!" }
              else
                div(class: "flex flex-col") do
                  render(Components::TableComponent.new(headers: ["Name", "Members", "Actions"])) do |t|
                    @teams.each do |team|
                      t.row do
                        t.checkbox(id: team.id)
                        t.cell { team.name }
                        t.cell { team.accounts.size }
                        t.action_cell do
                          button(
                            type: "button",
                            class: "text-white bg-cyan-600 hover:bg-cyan-700 focus:ring-4 focus:ring-cyan-200 font-medium rounded-lg text-sm inline-flex items-center px-3 py-2 text-center"
                          ) do
                            pen_to_square_icon
                            text("Edit")
                          end

                          button(
                            type: "button",
                            class: "text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm inline-flex items-center px-3 py-2 text-center"
                          ) do
                            trash_icon
                            text("Delete")
                          end
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
