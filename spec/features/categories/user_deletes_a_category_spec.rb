require 'rails_helper'

describe "User deletes a category" do
  scenario "a user can delete a category" do
    category = Category.create(name: "ESPN")

    visit category_path(category)

    click_on 'Delete'

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("ESPN was successfully destroyed.")
  end
end
