module Shared
  module SVGCollection
    def plus_icon
      svg(
        class: "-ml-1 mr-2 h-6 w-6",
        fill: "currentColor",
        viewBox: "0 0 20 20",
        xmlns: xmlns
      ) do
        path(
          "fill-rule": "evenodd",
          d:
            "M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z",
          "clip-rule": "evenodd"
        )
      end
    end

    def trash_icon
      svg(
        class: "mr-2 h-5 w-5",
        fill: "currentColor",
        viewBox: "0 0 20 20",
        xmlns: xmlns
      ) do
        path(
          "fill-rule": "evenodd",
          d:
            "M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z",
          "clip-rule": "evenodd"
        )
      end
    end

    def pen_to_square_icon
      svg(
        class: "mr-2 h-5 w-5",
        fill: "currentColor",
        viewBox: "0 0 20 20",
        xmlns: xmlns
      ) do
        path(
          d:
            "M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z"
        )
        path(
          "fill-rule": "evenodd",
          d:
            "M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z",
          "clip-rule": "evenodd"
        )
      end
    end

    def magnifying_glass_icon
      svg(
        class: "w-5 h-5 text-gray-500",
        fill: "currentColor",
        viewBox: "0 0 20 20",
        xmlns: xmlns
      ) do
        path(
          "fill-rule": "evenodd",
          d:
            "M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z",
          "clip-rule": "evenodd"
        )
      end
    end

    def home_icon
      svg(
        class: "w-5 h-5 mr-2.5",
        fill: "currentColor",
        viewBox: "0 0 20 20",
        xmlns: xmlns
      ) do
        path(
          d:
            "M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"
        )
      end
    end

    def arrow_icon
      svg(
        class: "w-6 h-6 text-gray-400",
        fill: "currentColor",
        viewBox: "0 0 20 20",
        xmlns: xmlns
      ) do
        path(
          "fill-rule": "evenodd",
          d:
            "M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z",
          "clip-rule": "evenodd"
        )
      end
    end

    def notification_icon
      svg(
        class: "w-5 h-5 text-gray-500",
        fill: "currentColor",
        viewBox: "0 0 20 20",
        xmlns: xmlns
      ) do
        path(
          "fill-rule": "evenodd",
          d:
            "M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z",
          "clip-rule": "evenodd"
        )
      end
    end

    def user_icon
      svg(
        class: "w-5 h-5 text-gray-500",
        stroke_width: "1.5",
        fill: "currentColor",
        viewBox: "0 0 24 24",
        xmlns: xmlns
      ) do
        path(
          "fill-rule": "evenodd",
          d:
            "M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z",
          "clip-rule": "evenodd",
          "stroke-linecap": "round",
          "stroke-linejoin": "round"
        )
      end
    end

    def cross_icon
      svg(
        class: "w-5 h-5",
        fill: "currentColor",
        viewBox: "0 0 20 20",
        xmlns: xmlns
      ) do
        path(
          "fill-rule": "evenodd",
          d:
            "M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z",
          "clip-rule": "evenodd"
        )
      end
    end

    private

    def xmlns
      "http://www.w3.org/2000/svg"
    end
  end
end
