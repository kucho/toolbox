module Views
  module Dashboard
    module Pages
      class Layout < ApplicationView
        def template(&)
          render(Dashboard::BaseLayout.new(title: page_title)) { yield_content(&) }
        end

        def header(**args, &)
          render(Pages::Header.new(**args)) { yield_content(&) }
        end

        def body(&)
          div(&)
        end

        private

        def page_title
          helpers.breadcrumbs.map(&:name).reverse.append("Toolbox").join(" | ")
        end
      end
    end
  end
end
