require 'rails_helper'

RSpec.feature "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_job_path(company, job)

    click_link "Delete"

    expect(current_path).to eq(company_path(company))
    expect(page).to_not have_content(job.title)
    end
end
