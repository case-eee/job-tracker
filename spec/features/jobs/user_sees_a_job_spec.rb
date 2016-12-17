require 'rails_helper'

describe "User sees a specific job" do
  scenario "for a specific company" do
    company = create(:company)
    category = create(:category)
    job = create(:job)
    category.jobs << job

    visit company_job_path(company, job)

    expect(page).to have_content company.name
    expect(page).to have_content job.title
    expect(page).to have_content job.level_of_interest
    expect(page).to have_content category.title
  end
end
