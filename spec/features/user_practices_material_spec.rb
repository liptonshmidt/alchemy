require "rails_helper"

feature "user practices material" do
  scenario "clicking on according button" do
    user = create(:user)
    material = create(:material, user: user)

    visit materials_path(as: user)
    click_on t("materials.index.mark_practiced")

    expect(page).to have_content(
      t("materials.index.practices_count", practices_count: 1)
    )
  end
end
