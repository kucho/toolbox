module Views::Dashboard::Nav
  class Item < Views::ApplicationView
    def initialize(href:, text:)
      @text = text
      @href = href
    end

    def template
      li { a(href: @href, class: link_style) { @text } }
    end

    private

    def link_style
      <<-STYLES.squish
        text-base text-gray-900 font-normal rounded-lg flex items-center p-2 hover:bg-gray-100 group
      STYLES
    end
  end
end
