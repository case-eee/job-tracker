require 'rails_helper'

describe "User deletes job" do
  scenario "job deletes, company does not" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    inital_job_count = Job.count
    initial_company_count = Company.count

    visit company_path(company)
    click_on job.title
    click_on "Delete"

    expect(current_path).to eq company_path(company)
    expect(page).to have_content "#{job.title} was succesfully deleted!"
    expect(Job.count).to eq initial_job_count - 1
    expect(Company.count).to eq initial_company_count
  end
end