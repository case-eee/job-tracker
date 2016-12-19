
require 'rails_helper'

describe "User deletes a category" do
  scenario "a user can delete an existing category" do
    category = Category.create(title: "Janitorial")

    visit categories_path

    click_on "Delete"

    expect(page).to have_content("Mt. Doom")
  end
end