require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = create(:company)
    job = create(:job)
    visit new_company_job_path(company)

    fill_in "job[title]", with: job.title
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: job.level_of_interest
    fill_in "job[city]", with: job.city

    click_button "Create"
    
    job = Job.find(job.id)
    company = Company.find(company.id)

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content(job.company)
    expect(page).to have_content(job.level_of_interest)
    expect(page).to have_content(job.city)
  end
end
