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

  scenario "sees table of jobs by interest level" do

    company = create(:company_with_jobs)
    jobs = Job.all

    visit dashboard_path

    expect(page).to have_content "Number of Jobs by Level of Interest"

    jobs.group_by {|job| job.level_of_interest}.each do |level, jobs|
      expect(page).to have_content level
      expect(page).to have_content jobs.count
    end
  end

  scenario "sees top three companies by average interest level" do

  end

end