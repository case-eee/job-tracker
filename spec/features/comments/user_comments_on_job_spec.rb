require 'rails_helper'

describe "User sees comments section of job page" do
  scenario "a user adds a comment to a job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "This is my comment."
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("This is my comment")
  end

  scenario "a user deletes a comment" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)
    job.comments.create(content: "This is my comment.")

    visit company_job_path(company, job)

    expect(page).to have_content("This is my comment")

    click_link "Delete"

    expect(page).to_not have_content("This is my comment")
  end
end
