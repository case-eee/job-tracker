require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver")

    visit edit_company_job_path(company,job)

    fill_in "job[title]", with: "Staple Remover"
    click_on "Update Job"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Staple Remover")
    expect(page).to_not have_content("Developer")
  end
end
