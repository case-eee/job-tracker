require 'rails_helper'

RSpec.feature "User can create a new category" do
  scenario "when all require input is completed" do
    new_category_title = "Web Development"
    visit new_category_path

    fill_in "category[title]", with: new_category_title
    click_on "Save"

    expect(page).to have_content(new_category_title)
    expect(Category.count).to eq(1)
  end
  scenario "except when all require input is not completed" do
    visit new_category_path

    click_on "Save"

    expect(page).to have_content("Title can't be blank")
    expect(Category.count).to eq(0)
  end
  scenario "when fill in all reqiured input after error message" do
    new_category_title = "Web Development"
    visit new_category_path

    click_on "Save"

    fill_in "category[title]", with: new_category_title

    click_on "Save"

    expect(page).to have_content(new_category_title)
    expect(Category.count).to eq(1)
  end
end