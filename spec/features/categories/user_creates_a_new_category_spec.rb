require 'rails_helper'

describe "User creates a new category" do
  scenario "with valid attributes" do
      company = create(:company)

      visit new_company_job_path(company)
      click_on "New Category"

      fill_in "category[title]", with: "Technology"
      click_on "Create Category"

      expect(current_path).to eq category_path(Category.last)
      expect(Category.count).to eq 1
      expect(page).to have_content "Technology successfully created"
    end

  scenario "with invalid attributes" do
  
    visit new_category_path
    click_on "Create Category"

    expect(page).to have_content "Title can't be blank"
  end
end