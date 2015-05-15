require "rails_helper"

feature "user starts with alchemy" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_content t("materials.index.no_materials")
  end
end
