require 'rails_helper'

describe "User sees all jobs on category" do
  scenario "a user can see all jobs for a specific category" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Sports!!!")
    company.jobs.create(title: "Janitor", level_of_interest: 99, category: category)

    visit category_path(category)

    expect(page).to have_content("Sports!!!")
  end
end