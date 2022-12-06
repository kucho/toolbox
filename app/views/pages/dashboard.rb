module Views
  module Pages
    class Dashboard < ApplicationView

      def template
        render(Views::Dashboard::Layout.new(title: "Dashboard")) do
          h1 { "Placeholder content " }
        end
      end
    end
  end
end
