require 'rails_helper'

describe "User edits a category" do
  scenario "with valid data" do
  
    category = create(:category)
    first_title = category.title
    new_title = "Space Exploration"

    visit category_path(category)
    click_on "Edit"

    fill_in "category[title]", with: new_title
    click_on "Update"

    expect(current_path).to eq category_path(category)
    expect(page).to have_content new_title
    expect(page).to_not have_content first_title
  end

  scenario "with invalid data" do

    category = create(:category)
    visit edit_category_path(category)

    fill_in "category[title]", with: ""
    click_on "Update"

    expect(page).to have_content "Title can't be blank"
  end
end