require 'rails_helper'

describe "User updates existing job" do
  scenario "a user can update a job from the specific job page" do
    company = Company.create!(name: "ESPN")
    job   = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)


    click_link "Edit"
    fill_in "job[title]", with: "Sports Center Host"
    click_on "Update Job"

    expect(page).to_not have_content "Developer"
    expect(page).to     have_content "Sports Center Host"
  end
end
