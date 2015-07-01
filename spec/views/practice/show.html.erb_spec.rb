require "rails_helper"

describe "practice/show.html.erb" do

  context "when materials exist" do
    it "displays both incompleted and completed materials" do
      practice = double(:practice)
      allow(practice).to receive(:completed_materials).
        and_return([build_stubbed(:material, title: "first")])
      allow(practice).to receive(:incompleted_materials).
        and_return([build_stubbed(:material, title: "second")])
      assign(:practice, practice)

      render

      expect(rendered).to match "Completed materials"
      expect(rendered).to match "first"
      expect(rendered).to match "second"
    end
  end

  context "when no materials are completed yet" do
    it "doesn't display completed materials section" do
      practice = double(:practice)
      allow(practice).to receive(:completed_materials).and_return([])
      allow(practice).to receive(:incompleted_materials).and_return([])
      assign(:practice, practice)

      render

      expect(rendered).not_to match "Completed materials"
    end
  end

  context "when no materials given" do
    it "displays no-materials special text" do
      practice = double(:practice)
      allow(practice).to receive(:completed_materials).and_return([])
      allow(practice).to receive(:incompleted_materials).and_return([])
      assign(:practice, practice)

      render

      expect(rendered).to match t("practice.show.no_materials")
    end
  end
end

