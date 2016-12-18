require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job from the specific job page" do
    company = Company.create!(name: "ESPN")
    job   = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    click_link "Delete"

    expect(page).to_not have_content(job)
  end

  # scenario "a user can delete a job from the index" do
  #   company = Company.create!(name: "ESPN")
  #   job_1   = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
  #   job_2   = company.jobs.create!(title: "Sports Center Host", level_of_interest: 11, city: "Los Angeles")
  #
  #   visit company_jobs_path
  #
  #   within "job.#{job_1.id}" do
  #     click_link "Delete"
  #   end
  #
  #   expect(page).to_not have_content(job_1)
  # end
end
