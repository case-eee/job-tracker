require "rails_helper"

describe "A User edits a category" do
  scenario "A user can edit a preexisting category" do

  category = Category.create(title: "Icecream Vendor")

    visit categories_path

    click_on "Edit"
    fill_in "Title", with: "Sports"
    click_button "Update Category"

    expect(page).to have_content "Sports"
    expect(page).to_not have_content "Icecream Vendor"
  end
end
