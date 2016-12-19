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

    within '#categories' do
      first(:link, "Delete").click
    end
    within '#categories' do
      expect(page).to_not have_content("Technology")
    end
    expect(page).to have_content("Sports")
    expect(page).to have_content("Technology was successfully destroyed")
  end

  scenario "User deletes a Category with jobs" do
    company  = Company.create(name: 'Best Buy')
    category = Category.create(name: 'Sports')
    job      = company.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id)

    visit category_path(category)
    click_on 'Delete'

    visit company_job_path(company, job)

    expect(page).to have_content("Category Not Found")
  end
end
