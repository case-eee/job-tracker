require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job

    visit company_job_path(company, job)

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(Job.count).to eq(1)
    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.description)
    expect(page).to have_field("job_city", with: "#{job.city}", disabled: true)
    expect(page).to have_field("job_level_of_interest", with: "#{job.level_of_interest}", disabled: true)
  end
end
