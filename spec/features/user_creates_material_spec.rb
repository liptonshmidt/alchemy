require "rails_helper"

feature "user creates material" do
  scenario "successfully" do
    visit root_path

    click_on t("materials.index.add_new")
    fill_in "Title", with: "Quicksort"
    click_on t("helpers.submit.material.create")

    expect(page).to have_content "Quicksort"
  end
end
