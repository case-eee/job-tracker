require "rails_helper"

describe "A User edits a category" do
  scenario "A user can edit a preexisting category" do

  category = Category.create(title: "Web Developer")

    visit categories_path

    click_on "Edit"
    fill_in "Title", with: "Finance"
    click_button "Update Category"

    expect(page).to have_content "Finance"
    expect(page).to_not have_content "Web Developer"
  end
end
