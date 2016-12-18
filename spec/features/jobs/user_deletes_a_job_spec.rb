require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN")
    job_1 = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver")
    job_2 = company.jobs.create(title: "Bartender", level_of_interest: 70, city: "Denver")


    visit company_job_path(company, job_1)
    click_on "Delete this Job"

    expect(page).to have_content(job_2.title)
    expect(page).to have_content("Developer was successfully deleted!")
  end
end
