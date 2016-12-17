require 'rails_helper'

describe "User edits a job" do
  scenario "with valid data" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    create(:category).jobs << job

    visit company_job_path(company, job)
    click_on "Edit"

    fill_in "job[title]", with: "quarterback"
    click_on "Update"

    expect(current_path).to eq company_job_path(company, job)
    expect(page).to have_content "Successfully updated!"
    expect(page).to have_content "quarterback"
  end

  scenario "with invalid data" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    create(:category).jobs << job

    visit company_job_path(company, job)
    click_on "Edit"

    fill_in "job[title]", with: ""
    click_on "Update"

    expect(page).to have_content "Title can't be blank"
  end
end