require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category1 = Category.create(name: "Education")
    category2 = Category.create(name: "Technology")

    visit categories_path
    within(".category_#{category1.id}") do
      click_on "Edit"
    end

    fill_in "category[name]", with: "Business"
    click_button "Update"

    expect(current_path).to eq(category_path(category1))
    expect(page).to have_content("Business")
    expect(page).to_not have_content("Education")
end
end
