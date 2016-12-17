require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do

    visit new_category_path

    fill_in "category[name]", with: "Education"
    click_button "Create"

    expect(current_path).to eq(category_path(Category.last.id))
    expect(page).to have_content("Education")
    expect(Category.count).to eq(1)
  end

  scenario "a user cannot create a category that already exists" do
      Category.create(name: "Education")

      visit new_category_path

      fill_in "category[name]", with: "Education"
      click_button "Create"

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("Create a New Job Category Here!")
      expect(Category.count).to eq(1)
    end
  end
