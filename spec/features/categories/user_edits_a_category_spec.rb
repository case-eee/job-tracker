require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create(name: 'Technology')

    visit edit_category_path(category)

    fill_in 'category_name', with: "Finance"
    click_button 'Update Category'

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Finance")
    expect(page).to_not have_content("Technology")
  end

  context "User tries to edit a category that already exists" do
    scenario "user sees error message" do
      category = Category.create(name: 'Technology')
      category_2 = Category.create(name: 'Sports')

      visit edit_category_path(category)

      fill_in 'category_name', with: 'Sports'
      click_button 'Update Category'

      expect(page).to have_content('A category must have a unique name!')
    end
  end

  scenario "User edits a category from show page" do
    category = Category.create(name: 'Technology')

    visit(category_path(category))
    click_on 'Edit'

    expect(current_path).to eq(edit_category_path(category))
    expect(page).to have_content("Edit #{category.name}")
  end

  scenario "User edits a category from the index" do
    category   = Category.create(name: 'Technology')

    visit categories_path
    click_on 'Edit'

    expect(current_path).to eq(edit_category_path(category))
  end
end
