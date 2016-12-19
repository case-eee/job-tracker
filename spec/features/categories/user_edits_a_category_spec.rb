require 'rails_helper'

describe 'User clicks on edit' do
  scenario 'and can edit a category' do
    category = create(:category)
    visit categories_path

    click_link "Edit"
    fill_in "category[name]", with: "Changed"
    click_button "Update Category"

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Changed")
    expect(page).to_not have_content("#{category.name}")

  end
end