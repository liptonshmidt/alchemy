require "rails_helper"

feature "user views materials page" do
  scenario "sees own materials" do
    user = create(:user)
    material = create(:material, title: "My material", user: user)

    visit practice_path(as: user)

    expect(page).to have_content("My material")
  end

  scenario "doesn't see another user's materials" do
    another_user = create(:user)
    material = create(:material, title: "Another material", user: another_user)

    visit practice_path(as: create(:user))

    expect(page).not_to have_content("Another material")
  end
end
