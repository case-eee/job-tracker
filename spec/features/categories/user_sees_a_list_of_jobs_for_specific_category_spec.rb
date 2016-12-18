require 'rails_helper'

describe "User sees all jobs in a specific category" do
  scenario "a user sees all the jobs in a category" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Web Development")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

    visit category_path(category)

    expect(page).to have_content("All Web Development Jobs")
    expect(page).to have_content("Developer at ESPN")
    expect(page).to have_content("QA Analyst at ESPN")
  end

end
