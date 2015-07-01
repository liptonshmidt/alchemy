require "rails_helper"

describe "practice/show.html.erb" do

  context "when materials exist" do
    it "displays both incompleted and completed materials" do
      practice = stub_practice(
        completed: [build_stubbed(:material, title: "first")],
        incompleted: [build_stubbed(:material, title: "second")] )
      assign(:practice, practice)

      render

      expect(rendered).to match t("practice.show.completed_materials")
      expect(rendered).to match "first"
      expect(rendered).to match "second"
    end
  end

  context "when no materials are completed yet" do
    it "doesn't display completed materials section" do
      practice = stub_practice(completed: [])
      assign(:practice, practice)

      render

      expect(rendered).not_to match t("practice.show.completed_materials")
    end
  end

  context "when no active materials given" do
    it "displays no-materials special text" do
      practice = stub_practice(incompleted: [])
      assign(:practice, practice)

      render

      expect(rendered).to match t("practice.show.no_materials")
    end
  end

  def stub_practice(completed: [], incompleted: [])
    double(:practice).tap do |practice|
      allow(practice).to receive(:completed_materials).and_return(completed)
      allow(practice).to receive(:incompleted_materials).and_return(incompleted)
    end
  end
end
