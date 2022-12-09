module Views
  module Dashboard
    module Pages
      class Layout < ApplicationView
        def template(&content)
          render(Dashboard::BaseLayout.new(title: page_title)) { yield_content(&content) }
        end

        def header(**args, &content)
          render(Pages::Header.new(**args)) { yield_content(&content) }
        end

        def body(&content)
          div(&content)
        end

        private

        def page_title
          helpers.breadcrumbs.map(&:name).reverse.append("Toolbox").join(" | ")
        end
      end
    end
  end
end
