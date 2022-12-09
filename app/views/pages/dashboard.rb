module Views
  module Pages
    class Dashboard < ApplicationView

      def template
        render(Views::Dashboard::Pages::Layout.new) do |c|
          c.header
          c.body do
            # cards
            div(class: "flex gap-10 m-7 justify-center") do
              # <= CARD BEGIN
              div(class: "flex flex-col w-52 h-40 rounded-md bg-white shadow-md justify-between px-3 pb-2 pt-3") do
                div(class: "flex flex-row justify-between") do
                  div(class: "flex text-xl w-10") { "🛒" }
                  div(class: "flex w-13 justify-center text-xs items-center rounded-full bg-emerald-300 text-white px-1.5 py-0.5") { "+20%" }
                end

                div(class: "") do
                  h3(class: "font-bold text-3xl") { "2,400" }
                  p(class: "text-base text-gray-500") { "items sales" }
                end
              end
              # CARD END =>
              # <= CARD BEGIN
              div(class: "flex flex-col w-52 h-40 rounded-md bg-white shadow-md justify-between px-3 pb-2 pt-3") do
                div(class: "flex flex-row justify-between") do
                  div(class: "flex text-xl w-10") do
                    "🏪"
                  end

                  div(class: "flex w-13 justify-center text-xs items-center rounded-full bg-rose-500 text-white px-1.5 py-0.5") do
                    "-12%"
                  end
                end

                div(class: "") do
                  h3(class: "font-bold text-3xl") { "400" }
                  p(class: "text-base text-gray-500") { "orders placed" }
                end
              end
              # CARD END =>
              # <= CARD BEGIN
              div(class: "flex flex-col w-52 h-40 rounded-md bg-white shadow-md justify-between px-3 pb-2 pt-3") do
                div(class: "flex flex-row justify-between") do
                  div(class: "flex text-xl w-10") { "🛒" }

                  div(class: "flex w-13 justify-center text-xs items-center rounded-full bg-amber-300 text-white px-1.5 py-0.5") do
                    "~0%"
                  end
                end

                div(class: "") do
                  h3(class: "font-bold text-3xl") { "29000" }
                  p(class: "text-base text-gray-500") { "new registered users" }
                end
              end
              # CARD END =>
            end
          end
        end
      end
    end
  end
end
