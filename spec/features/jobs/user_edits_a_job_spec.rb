require 'rails_helper'

describe "User edits a specific job" do
  scenario "starting from job show" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit edit_company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")

    fill_in "job[title]", with: "Engineering"
    click_on "Update"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Engineering")
    expect(page).not_to have_content("Developer")
  end
end
