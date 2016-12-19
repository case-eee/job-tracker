require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category from index page" do
    category = create(:category)
    updated_category_name = "New Category Title"
    visit categories_path

    click_on "Edit"

    fill_in "category[title]", with: updated_category_name
    click_on "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content(updated_category_name)
    expect(page).to_not have_content(category.title)
  end
  scenario "a user sees error when want to update category with empty title" do
    category = create(:category)
    visit edit_category_path(category)

    fill_in "category[title]", with: ""
    click_on "Update"

    expect(page).to have_content("Title can't be blank")
    expect(Category.count).to eq(1)
  end
  scenario "a user can update details after error for the first time" do
    category = create(:category)
    updated_category_name = "Updated Name"
    visit edit_category_path(category)

    fill_in "category[title]", with: ""
    click_on "Update"

    fill_in "category[title]", with: updated_category_name
    click_on "Update"
    
    expect(page).to have_content(updated_category_name)
    expect(Category.count).to eq(1)
  end
end
