require 'rails_helper'

RSpec.feature "User sees all categories" do
  scenario "when they visit index" do
    category1, category2 = create_list(:category, 2)
    visit categories_path

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category1.title)
  end

  scenario "they can delete the categories from index" do
    category1, category2 = create_list(:category, 2)
    visit categories_path
    within("tr", :text => category1.title) do
      within("td:last") do
        click_on "Delete"
      end
    end

    expect(page).to_not have_content(category1.title)
  end

  scenario "they cannot update a category with invalid params" do
    category1, category2 = create_list(:category, 2)
    visit categories_path
    within("tr", :text => category1.title) do
      click_on "Edit"
    end
    fill_in "category[title]", :with => ""
    click_on "Update Category"

    expect(page).to have_content("Title can't be blank")
  end
end