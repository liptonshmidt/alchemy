require "rails_helper"

describe "materials/index.html.erb" do

  context "when materials exist" do
    it "displays all the materials" do
      assign(:materials, [
        build_stubbed(:material, title: "first"),
        build_stubbed(:material, title: "second"),
      ])

      render

      expect(rendered).to match "first"
      expect(rendered).to match "second"
    end

    context "when material was practiced at least once" do
      it "shows practices count" do
        assign(:materials, [build_stubbed(:material, practices_count: 3)])

        render

        expect(rendered).to match(
          t("materials.index.practices_count", practices_count: 3)
        )
      end
    end

  end

  context "when no materials given" do
    it "displays no-materials special text" do
      assign(:materials, [])

      render

      expect(rendered).to match t("materials.index.no_materials")
    end
  end
end

