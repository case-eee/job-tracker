require 'rails_helper'

describe "User visits jobs" do
  scenario "sorted by location" do
    
    company = create(:company_with_jobs)

    visit "/jobs?sort=location"

    expect(page).to have_content "Jobs Sorted by City"

    Job.all.each do |job|
      expect(page).to have_content job.city
    end
  
  end

  scenario "sorted by level of interest" do

     company = create(:company_with_jobs)

    visit "/jobs?sort=interest"

    expect(page).to have_content "Jobs Sorted by Level of Interest"

    Job.all.each do |job|
      expect(page).to have_content job.level_of_interest
    end
  end
end
