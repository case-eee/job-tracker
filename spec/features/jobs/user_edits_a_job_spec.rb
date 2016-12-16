require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit an existing job" do
    company         = Company.create(name: "ESPN")
    job             = company.jobs.create(title: "Mime", level_of_interest: 10, city: "Denver")
    new_job_title   = "Comedian"
    job_description = "super kewl job"
    new_interest    = 5
    new_city        = 'Baltimore'

    visit company_job_path(company, job)
    # save_and_open_page
    click_on "Edit"
    fill_in 'job_title', with: new_job_title
    fill_in 'job_description', with: job_description
    fill_in 'job_level_of_interest', with: new_interest
    fill_in 'job_city', with: new_city
    click_on 'Update Job'

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content new_job_title
    expect(page).to have_content new_interest
    expect(page).to have_content new_city
  end
end
