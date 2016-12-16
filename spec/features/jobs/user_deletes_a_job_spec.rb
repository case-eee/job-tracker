require 'rails_helper'

RSpec.feature "User deletes existing job" do
  scenario "and it successfully deletes" do
    company = create(:company_with_jobs)
    job = company.jobs.last

    visit company_job_path(company, job)
    save_and_open_page
    click_link "Delete"

    expect(page).to have_content("#{job.title} has been deleted!")
  end
end