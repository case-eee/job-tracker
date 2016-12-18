require 'rails_helper'

describe "User clicks on delete" do
  scenario "and it deletes the category" do
    category = create(:category)
    visit categories_path

    click_link "Delete"

    expect(page).to_not have_content("#category.name")
    expect(current_path).to eq(categories_path)
  end
end