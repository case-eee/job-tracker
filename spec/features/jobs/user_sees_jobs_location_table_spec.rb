require 'rails_helper'

describe "User visits jobs" do
  scenario "sees table of jobs by location" do

    company = create(:company_with_jobs)
    job = company.jobs.first
    city = job.city

    visit jobs_path

    expect(page).to have_content "Number of Jobs by Location"
    expect(page).to have_content city
    expect(page).to have_content job
    expect(page).to have_css href="jobs?location=#{city}"
  end
end