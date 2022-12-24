module Shared
  module Layouts
    class BaseLayout < ApplicationView
      include Phlex::Rails::Layout

      def initialize(title:)
        @title = title
      end

      def template(&content)
        doctype
        html do
          head do
            meta(charset: "utf-8")
            csp_meta_tag
            csrf_meta_tags
            meta(
              name: "viewport",
              content: "width=device-width,initial-scale=1"
            )
            title { @title }
            stylesheet_link_tag("application", "data-turbo-track": "reload")
            javascript_include_tag(
              "application",
              "data-turbo-track": "reload",
              defer: true
            )
            if Rails.env.development?
              javascript_include_tag("hotwire-livereload", defer: true)
            end

            body(class: "bg-gray-50", &content)
          end
        end
      end
    end
  end
end
