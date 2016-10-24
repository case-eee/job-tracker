require 'rails_helper'

describe "User deletes an existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN", city: "NYC")
    job = company.jobs.create(title: "Developer", description: "amazing", level_of_interest: 60)

    visit company_job_path(company, job)

    click_link "Delete"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to_not have_content("Developer")
    expect(page).to_not have_content("80")
  end
end
