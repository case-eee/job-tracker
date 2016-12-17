require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = create(:company)
    job1, job2 = create_list(:job, 2)
    company.jobs << [job1, job2]

    visit company_jobs_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_link(job1.title)
    expect(page).to have_link(job2.title)
  end
end
