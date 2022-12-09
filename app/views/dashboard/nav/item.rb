module Views::Dashboard::Nav
  class Item < Views::ApplicationView
    def initialize(href: "#", text: "", class_name: nil)
      @href = href
      @text = text
      @class_name = class_name
    end

    def template(&custom_content)
      li(class: @class_name) do
        return yield_content {
          custom_content.call(element_style)
        } if custom_content.present?
        
        a(href: @href, class: element_style) { @text }
      end
    end

    private
    def element_style
      <<-STYLES.squish
        text-base text-gray-900 font-normal rounded-lg flex items-center p-2 hover:bg-gray-100 group
      STYLES
    end
  end
end
