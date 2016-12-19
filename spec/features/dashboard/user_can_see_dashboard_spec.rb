require 'rails_helper'

describe "User can see dashboard page" do
  scenario "user can navigate to dashboard from nav" do
    visit companies_path

    within("nav") do
      click_on "dashboard"
    end

    expect(current_path).to eq(dashboard_path)
  end

  scenario "user can see dashboard sorted by interest" do
    job1 = create(:job, city: "San Francisco" )
    job2 = create(:job, city: "Atlanta" )
    job3 = create(:job)

    interest_levels = Job.interest_levels
    byebug
  end

  scenario "user can see three top companies" do
    skip
  end

  scenario "user can see corresponding level of interest" do
    skip
  end

  scenario "user can see a count of jobs by location" do
    job3 = create(:job)

    visit jobs_path("sort=location")

    expect(page).to have_content("Denver")
    expect(page).to have_content(1)
  end
end
