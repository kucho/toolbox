module Landing
  class RootView < Phlex::HTML
    def template
      render(Shared::Layouts::BaseLayout.new(title: "Landing")) do
        h1(class: "text-5xl font-bold text-center") do
          "LANDING PAGE IN PROGRESS!"
        end
      end
    end
  end
end
