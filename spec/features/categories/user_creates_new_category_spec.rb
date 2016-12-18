require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Clerical"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Clerical")
    expect(Category.count).to eq(1)
  end

  scenario "a user cannot create a duplicate category" do
    category = Category.create!(title: "Clerical")

    visit new_category_path

    fill_in "category[title]", with: "Clerical"
    click_button "Create"

    expect(current_path).to eq("/categories/new")
    expect(page).to have_content("Clerical already exists.")
  end

end
