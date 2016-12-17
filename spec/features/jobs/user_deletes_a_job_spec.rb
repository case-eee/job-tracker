require 'rails_helper'

describe "User deletes job" do
  scenario "job deletes, company does not" do
    company = create(:company_with_jobs_and_contacts)
    job = company.jobs.first
    create(:category).jobs << job

    initial_job_count = Job.count
    initial_company_count = Company.count

    visit company_job_path(company, job)

    click_on "Delete"

    expect(current_path).to eq company_jobs_path(company)
    expect(page).to have_content "You deleted #{job.title}"
    expect(Job.count).to eq initial_job_count - 1
    expect(Company.count).to eq initial_company_count
  end

  scenario "comments also deleted" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    create(:category).jobs << job
    current_comment_count = Comment.count

    visit company_job_path(company, job)

    click_on "Delete"

    expect(Comment.count).to eq current_comment_count - 2
  end
end