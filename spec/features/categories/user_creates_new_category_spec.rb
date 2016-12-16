require 'rails_helper'

RSpec.feature "User creates new category" do
  scenario "User creates new category" do
    visit categories_path
    click_on "New Category"
    fill_in "category[title]", :with => "Web Development"
    click_on "Create Category"

    expect(page).to have_content("Web Development")
  end

  scenario "Category is invalid and does not save" do
    visit categories_path
    click_on "New Category"
    click_on "Create Category"
    
    expect(page).to have_content("Title can't be blank")
  end

  scenario "Category is not unique and can't be saved" do
    visit categories_path
    click_on "New Category"
    fill_in "category[title]", :with => "Web Development"
    click_on "Create Category"

    visit categories_path
    click_on "New Category"
    fill_in "category[title]", :with => "Web Development"
    click_on "Create Category"

    expect(page).to have_content("Title has already been taken")
  end
end