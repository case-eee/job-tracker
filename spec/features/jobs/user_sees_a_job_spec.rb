require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = create(:company_jobs, name: "ESPN")
    job = company.jobs.find_by(title: "Title_1")
    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Title_1")
    expect(page).to have_content("0")
  end
end
