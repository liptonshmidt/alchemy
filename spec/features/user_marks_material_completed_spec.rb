require "rails_helper"

feature "user marks material completed" do
  scenario "from the materials list" do
    user = create(:user)
    material_to_complete = create(:material, user: user)

    visit practice_path(as: user)
    click_on t("materials.actions.mark_completed")

    within ".completed-materials" do
      expect(page).to have_content "Completed materials"
      expect(page).to have_content material_to_complete.title
    end
  end
end
