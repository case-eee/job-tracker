require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end

  scenario "a user can pick a job category" do
    Category.create!(title: "academic")
    Category.create!(title: "engineering")
    category = Category.create!(title: "janitorial")
    company = Company.create!(name: "Dropbox")

    visit new_company_job_path(company)
    select "janitorial"

    expect(page).to have_content("Job Category")
  end

  scenario "a user wants to create a new job category" do 
    Category.create!(title: "academic")
    Category.create!(title: "engineering")
    category = Category.create!(title: "janitorial")
    company = Company.create!(name: "Dropbox")

    visit new_company_job_path(company)
    click_on "Create New Job Category"

    expect(current_path).to eq("/categories/new")
  end
end
