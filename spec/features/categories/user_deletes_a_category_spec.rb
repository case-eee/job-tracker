require 'rails_helper'

describe "User deletes a category" do
  scenario "a user can delete a category" do
    category = Category.create(name: "ESPN")

    visit category_path(category)

    click_on 'Delete'

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("ESPN was successfully destroyed.")
  end

  scenario "a user deletes a category from the index page" do
    category = Category.create(name: "Technology")
    category_2 = Category.create(name: "Sports")

    visit categories_path
    # save_and_open_page

    within '#categories' do
      first(:link, "Delete").click
    end
    within '#categories' do
      expect(page).to_not have_content("Technology")
    end
    expect(page).to have_content("Sports")
    expect(page).to have_content("Technology was successfully destroyed")
  end
end
