require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do

    visit new_category_path

    fill_in "category[title]", with: "Software Development"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Software Development")
    expect(Category.count).to eq(1)
  end

  scenario "a user tries to create invalid category" do

    category = create(:category)

    visit new_category_path

    fill_in "category[title]", with: "Software Development"
    click_button "Create"

    expect(page).to have_content("Create A New Category")

  end
end
