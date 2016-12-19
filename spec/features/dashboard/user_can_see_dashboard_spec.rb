require 'rails_helper'

describe "User can see dashboard page" do
  let!(:company1) { create(:company_with_jobs) }
  let!(:company2) { create(:company_with_jobs) }
  let!(:company3) { create(:company_with_jobs) }
  let!(:job1)    { create(:job, city: "San Francisco", company: company1) }
  let!(:job2)    { create(:job, city: "Atlanta", company: company1) }
  let!(:job3)    { create(:job, city: "Paris", company: company2) }

  scenario "user can navigate to dashboard from nav" do
    visit companies_path

    within("nav") do
      click_on "dashboard"
    end

    expect(current_path).to eq(dashboard_path)
  end

  scenario "user can see dashboard sorted by interest" do
    interest_levels = Job.interest_levels

    expect(interest_levels.first[0]).to eq(25)
  end

  scenario "user can see three top companies" do
    company1.jobs.first.level_of_interest = 1000
    top_companies = Job.top_companies

    expect(top_companies.count).to eq(3)
  end

  scenario "user can see corresponding level of interest" do
    visit jobs_path("sort=interest")
    company1.jobs.first.update(level_of_interest: 1000)

    expect(page).to have_content(company1.name)
    expect(page).to have_content(80)
  end

  scenario "user can see a count of jobs by location" do
    visit jobs_path("sort=location")

    expect(page).to have_content("San Francisco")
    expect(page).to have_content(1)
  end
end
