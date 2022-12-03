module Views
  module Layouts
    class Application < Phlex::HTML
      include Phlex::Rails::Layout

      def initialize(title:)
        @title = title
      end

      def template(&)
        html do
          head do
            meta charset: "utf-8"
            csp_meta_tag
            csrf_meta_tags
            meta name: "viewport", content: "width=device-width,initial-scale=1"
            title { @title }
            stylesheet_link_tag "application"
            javascript_include_tag "application"
          end

          body(&)
        end
      end
    end
  end
end