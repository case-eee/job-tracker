require 'rails_helper'

describe "User deletes an existing job" do
  scenario "a user can delete a job" do
    company         = Company.create(name: "ESPN")
    job             = company.jobs.create(title: "Mime", level_of_interest: 10, city: "Denver")
    job_2           = company.jobs.create(title: "burger flipper", level_of_interest: 10, city: "Denver")

    visit company_job_path(company, job)

    click_on 'Delete'

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to_not have_content(job.title)
    expect(page).to have_content(job_2.title)
  end
end
