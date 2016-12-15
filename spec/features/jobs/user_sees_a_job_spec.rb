require 'rails_helper'

describe "User sees a specific job" do
  scenario "for a specific company" do
    company = create(:company)
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    expect(page).to have_content company.name
    expect(page).to have_content job.title
    expect(page).to have_content job.level_of_interest
  end
end
