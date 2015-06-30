require "rails_helper"

feature "user practices material" do
  scenario "clicking on according button" do
    user = create(:user)
    material = create(:material, user: user)

    visit practice_path(as: user)
    click_on t("practice.show.mark_practiced")

    expect(page).to have_content(
      t("practice.show.practices_count", practices_count: 1)
    )
  end
end
