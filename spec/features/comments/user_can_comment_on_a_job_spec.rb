require 'rails_helper'

describe "user sees the comment section on the job page" do
  scenario "a user is able to add a comment to a job" do
    company = Company.create!(name: "ESPN")
    job     = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")


    visit company_job_path(company, job)

    fill_in "comment[content]", with: "This looks like a dream job!"
    click_on "Create Comment"

    expect(current_path).to eq(company_job_path(company, job))
  end
end
