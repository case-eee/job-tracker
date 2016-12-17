require 'rails_helper'

RSpec.feature "User sees all companies" do
  scenario "a user can delete a category from index page" do
    category = create(:category, title: "Finance")

    visit categories_path
    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Finance was successfully deleted!")
  end

  scenario "a user can edit a category from index page" do
    category = create(:category)

    visit categories_path
    within(".category_#{category.id}") do
      click_link "Edit"
    end

    fill_in "category[title]", with: "Finance"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Finance")
  end
end
