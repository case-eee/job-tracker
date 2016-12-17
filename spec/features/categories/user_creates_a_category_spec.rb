require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do

    visit new_category_path

    fill_in "category[name]", with: "Web Developer"
    click_button "Create"

    expect(current_path).to eq(category_path(Category.last.id))
    expect(page).to have_content("Web Developer")
    expect(Category.count).to eq(1)
  end

  scenario "a user can create a new category from the index" do
    visit(categories_path)

    click_on 'Create New Category'
    fill_in 'category[name]', with: "Web Developer"
    click_on 'Create'

    expect(current_path).to eq(category_path(Category.last.id))
    expect(page).to have_content("Web Developer")
    expect(page).to have_content("Web Developer created!")
    expect(Category.count).to eq(1)
  end

  context "a user creates an identical category" do
    scenario "a user sees an error message" do
      Category.create(name: "Web Developer")

      visit(categories_path)

      click_on 'Create New Category'
      fill_in 'category[name]', with: 'Web Developer'
      click_on 'Create'

      expect(page).to have_content("That category already exists!")
    end
  end

  context "user visits job create page" do
    scenario "user wants to create a category first" do
      company = Company.create(name: "ESPN")
      visit new_company_job_path(company)

      click_on 'Make one here!'

      expect(current_path).to eq(new_category_path)
    end
  end
end
