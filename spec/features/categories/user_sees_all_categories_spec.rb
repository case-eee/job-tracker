require 'rails_helper'

RSpec.feature "User sees all categories" do
  scenario "a user can delete a category from index page" do
    category = create(:category, title: "Finance")

    visit categories_path
    click_link "Delete"

    expect(page).to have_content("Finance was successfully deleted!")
  end

  scenario "a user can edit a category from index page" do
    category = create(:category)

    visit categories_path
    click_link "Edit"

    fill_in "category[title]", with: "Finance"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Finance")
  end
end
