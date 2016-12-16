require 'rails_helper'

describe "User can edit details of existing job" do
  scenario "when completes all fields" do
    company = Company.create(name: "ESPN")
    job = Job.create(title: "Job Title", description: "Job test description", level_of_interest: 10, city: "Phoenix", company: company)
    new_job_title = "Developer"
    new_job_description = "So fun!"
    new_job_level_of_interest = "80"
    new_job_city = "Denver, CO"

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: new_job_title
    fill_in "job[description]", with: new_job_description
    fill_in "job[level_of_interest]", with: new_job_level_of_interest
    fill_in "job[city]", with: new_job_city

    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(Job.count).to eq(1)
    expect(page).to have_content(company.name)
    expect(page).to have_content(new_job_title)
    expect(page).to have_content(new_job_description)
    expect(page).to have_field("job_city", with: "#{new_job_city}", disabled: true)
    expect(page).to have_field("job_level_of_interest", with: "#{new_job_level_of_interest}", disabled: true)
  end
end