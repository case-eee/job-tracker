require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company_with_jobs)
    delete = company.jobs.first
    visit company_job_path(company, delete)

      click_link "Delete"
      
    expect(page).to have_content("#{delete.title} was successfully deleted!")
  end
end
