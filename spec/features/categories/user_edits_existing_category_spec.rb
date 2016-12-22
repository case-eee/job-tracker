require 'rails_helper'

RSpec.feature "User edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category)

    visit edit_category_path(category)

    fill_in "category[title]", with: "Not Software Development"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Not Software Development")
  end
end
