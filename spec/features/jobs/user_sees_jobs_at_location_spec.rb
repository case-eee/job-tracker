require 'rails_helper'

describe "User sees all jobs in a city" do
  scenario "by specifying parameters" do
    
    company = create(:company_with_jobs)
    job = company.jobs.first
    city = job.city

    visit "/jobs?location=#{city}"

    expect(page).to have_content "All Jobs in #{city}"
    expect(page).to have_content job.title
    expect(page).to have_content company.name
  end
end