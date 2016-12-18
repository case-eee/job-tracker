require 'rails_helper'

describe "User visits jobs" do
  scenario "sees table of jobs by location" do

    company = create(:company_with_jobs)
    jobs = Job.all

    visit dashboard_path

    expect(page).to have_content "Number of Jobs by Location"

    jobs.group_by {|job| job.city}.each do |city, jobs|
      expect(page).to have_content city
      expect(page).to have_content jobs.count
    end
  end
end