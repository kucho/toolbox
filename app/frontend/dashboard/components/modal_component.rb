module Dashboard
  module Components
    class ModalComponent < ApplicationView
      include Shared::SVGCollection
      def initialize(id:)
        @id = id
      end

      def template(&content)
        div(class: modal_wrapper_style, id: @id) do
          div(class: "relative w-full max-w-2xl px-4 h-full md:h-auto") do
            div(class: "bg-white rounded-lg shadow relative") do
              yield_content(&content)
            end
          end
        end
      end

      def header(&content)
        div(class: "flex items-start justify-between p-5 border-b rounded-t") do
          yield_content(&content)
          button(
            :class => "text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center",
            :"data-modal-toggle" => @id
          ) do
            cross_icon
          end
        end
      end

      def body(&content)
        div(class: "p-6 space-y-6", &content)
      end

      def footer(&content)
        div(class: "p-6 border-t border-gray-200 rounded-b", &content)
      end

      def modal_wrapper_style
        <<-STYLE.squish
          hidden overflow-x-hidden overflow-y-auto fixed top-4 left-0 right-0
          md:inset-0 z-50 justify-center items-center h-modal sm:h-full
        STYLE
      end
    end
  end
end
