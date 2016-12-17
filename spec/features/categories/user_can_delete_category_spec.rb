require 'rails_helper'

describe "User deletes category" do
  scenario "user can delete a category" do
    category = Category.create(title: "Finance")
    category = Category.create(title: "Education")

    visit categories_path
    first(:link, "Delete").click

  expect(page).to_not have_content "Finance"
  expect(page).to have_content "Education"
  end
end
