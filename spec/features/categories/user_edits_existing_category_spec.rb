require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category)
    visit edit_category_path(category)

    fill_in "category[title]", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("#{category.title}")
  end

  scenario "a user edits with invalid data" do
    category = create(:category)
    visit edit_category_path(category)

    fill_in "category[title]", with: ""
    click_button "Update"

    expect(page).to have_content("Title can't be blank")
  end
end
