require "rails_helper"

feature "user creates material" do
  scenario "with valid attributes" do
    submit_material(title: "Quicksort")
    expect(page).to have_content "Quicksort"
  end

  scenario "with valid attributes" do
    submit_material(title: "")
    expect(page).to have_content "can't be blank"
  end

  def submit_material(title:)
    visit root_path
    click_on t("materials.index.add_new")
    fill_in "Title", with: title
    click_on t("helpers.submit.material.create")
  end
end
