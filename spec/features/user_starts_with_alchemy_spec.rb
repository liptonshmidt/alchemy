require "rails_helper"

feature "user starts with alchemy" do
  scenario "successfully" do
    visit root_path(as: create(:user))

    expect(page).to have_content t("practice.show.no_materials")
  end
end
