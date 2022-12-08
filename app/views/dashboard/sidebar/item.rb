module Views::Dashboard::Sidebar
  class Item < Views::ApplicationView
    def initialize(text:, href:)
      @text = text
      @href = href
    end

    def template
      li do
        a(href: @href, class: "text-base text-gray-900 font-normal rounded-lg flex items-center p-2 hover:bg-gray-100 group") do
          span(class: "ml-3") { @text }
        end
      end
    end
  end
end
