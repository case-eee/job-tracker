require "rails_helper"

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category)
    visit edit_category_path(category)
    fill_in("Title", with: "Sheep Enthusiast")
    click_button("Update")

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Sheep Enthusiast")
  end
end
