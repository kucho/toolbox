module Views::Dashboard::Sidebar
  class Item < Views::ApplicationView
    def initialize(text:, href:)
      @text = text
      @href = href
    end

    def template
      li do
        a(href: @href, class: "flex items-center p-2 text-base font-normal rounded-lg dark:text-white hover:bg-gray-100") do
          span(class: "text-gray-900 ml-3") { @text }
        end
      end
    end
  end
end
