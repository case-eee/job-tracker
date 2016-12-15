require 'rails_helper'

RSpec.feature "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company)
    job_1, job_2 = create_list(:job, 2)
    company.jobs << [job_1, job_2]

    visit company_job_path(company, job_1)

    click_link "Delete"

    expect(current_path).to eq(company_path(company))
    expect(page).to_not have_content(job_1.title)

    end
end
