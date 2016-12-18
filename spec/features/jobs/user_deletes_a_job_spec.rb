require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Developer", description: "wow, so fun", level_of_interest: 77, city: "Los Angeles")  

    visit company_job_path(company, job)
    click_link "Delete"

    expect(page).not_to have_content("Developer")
  end
end