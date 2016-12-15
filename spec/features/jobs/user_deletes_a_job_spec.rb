require 'rails_helper'

RSpec.feature "User deletes a job" do
  
  scenario "the job is removed and they are redirected to the company's jobs'" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    visit company_job_path(company, company.jobs.first)
    click_on "Delete"

    expect(page).to_not have_content("Developer")
    expect(current_path).to eq(company_jobs_path(company))
  end

end