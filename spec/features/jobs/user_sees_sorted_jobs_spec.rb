require 'rails_helper'

describe "User visits jobs" do
  scenario "sorted by location" do
    
    company = create(:company_with_jobs)

    visit "/jobs?sort=location"

    expect(page).to have_content "Jobs Sorted by Location"

    Job.all.each do |job|
      expect(page).to have_content job.city
    end
  
  end

  scenario "sorted by level of interest" do

     company = create(:company_with_jobs)

    visit "/jobs?sort=interest"

    expect(page).to have_content "Jobs Sorted by Level of Interest"

    jobs = Job.all
    jobs.each_with_index do |job, index|
      expect(page).to have_content job.level_of_interest
      if job.level_of_interest > jobs[index - 1].level_of_interest
        expect( page.body.index(job.title) < page.body.index(jobs[index - 1].title) ).to eq true
      end
    end
  end
end
