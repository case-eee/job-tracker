require 'rails_helper'

describe "User can delete a job" do
  scenario "a user can delete a job from the jobs index" do
    company = create(:company)
    job = create(:job)

    company.jobs << job

    visit company_jobs_path(company)

    within("job-#{job.id}") do
      click_on "Delete Job"
    end

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).not_to have_content(job.title)
  end

  scenario "a user can delete a job from the jobs show page" do
    company = Company.create!(name: "ESPN")
    job = Job.create(title: "Wrangler",
                    description: "does stuff",
                    city: "Denver",
                    level_of_interest: 80)

    company.jobs << job

    visit company_job_path(company, job)

    click_on "Delete Job"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).not_to have_content(job.title)
  end
end
