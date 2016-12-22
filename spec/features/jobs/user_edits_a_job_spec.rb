require 'rails_helper'

describe "User edits existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Developer", description: "wow, so fun", level_of_interest: 77, city: "Los Angeles")  
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "NFL Commentator"
    click_on "Update Job"

    expect(page).not_to have_content("Developer")
    expect(page).to have_content("NFL Commentator")
  end

  scenario "should require a title or prompt an error" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Developer", description: "wow, so fun", level_of_interest: 77, city: "Los Angeles")  
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: " "
    click_on "Update Job"

    expect(page).to have_content("Title can't be blank")
  end
end