module Views::Dashboard::Nav
  class Item < Phlex::HTML
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
       block py-2 pl-3 pr-4 text-gray-700 rounded
       hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700
       md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700
       dark:hover:text-white md:dark:hover:bg-transparent
      STYLES
    end
  end
end
