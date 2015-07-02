require "rails_helper"

feature "user transits completed item  to active" do
  scenario "successfully" do
    user = create(:user)
    completed_material = create(:material, user: user, completed: true)

    visit practice_path(as: user)
    click_on "Make active"

    within ".active-materials" do
      expect(page).to have_content completed_material.title
    end
  end
end
