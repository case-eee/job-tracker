require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = create(:company)
    job1 = create(:job)
    job2 = create(:job)
    company.jobs << job1
    company.jobs << job2

    visit company_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)
  end
end
