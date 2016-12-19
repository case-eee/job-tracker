require 'rails_helper'

describe "User deletes an existing job" do
  scenario "a user can delete a job" do
    # job = Job.first
    company = Company.all[2]
    content = "The #{company.name} #{company.jobs.first.title} position was successfully deleted!"

    visit company_jobs_path(company)

    click_link "Delete"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content(content)
  end
end
