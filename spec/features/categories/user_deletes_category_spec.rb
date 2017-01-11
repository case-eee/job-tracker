require 'rails_helper'

describe "User deletes category" do
  scenario "user can delete a category" do
    Category.create(title: "Sports")
    Category.create(title: "Basket-Weaving")

    visit categories_path
    first(:link, "Delete").click

  expect(page).to_not have_content "Sports"
  expect(page).to have_content "Basket-Weaving"
  end
end
