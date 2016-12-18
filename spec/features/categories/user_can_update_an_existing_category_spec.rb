require 'rails_helper'

describe "User can update and existing category" do
  scenario "a user can update a category" do
    category = create(:category)

    visit category_path(category)

    click_on("Edit")

    fill_in "category[title]", with: "New title"

    click_button "Update"

    expect(page).to have_content("New title")
  end
end
