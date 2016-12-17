require 'rails_helper'

describe "User sees all jobs" do
  scenario "for a specific company" do
    company = create(:company_with_jobs)
    job_one = company.jobs.first
    job_two = company.jobs.last

    visit company_path(company)

    expect(page).to have_content company.name
    expect(page).to have_content job_one.title
    expect(page).to have_content job_two.title
  end
end
