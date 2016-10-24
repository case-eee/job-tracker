require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create(name: "ESPN", city: "NYC")
    job = company.jobs.create(title: "Developer", description: "amazing", level_of_interest: 60)

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Architect"
    fill_in "job[description]", with: "serious"
    fill_in "job[level_of_interest]", with: 80

    click_button "Update"

    click_link "Architect"

    expect(page).to have_content("Architect")
    expect(page).to have_content("serious")
    expect(page).to have_content("80")
  end
end
