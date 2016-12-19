require 'rails_helper'

RSpec.feature "User can sort jobs" do

  scenario "by location" do
    job1, job2 = create_list(:job, 2)
    visit "/jobs?sort=location"

    within("div.col-md-4") do
      expect(page).to have_content("Denver, CO")
    end

    within("li.list-group-item:nth-of-type(1)") do
      expect(page).to have_content(job1.title)
    end
  end

  scenario "by level of interest" do
    job1, job2 = create_list(:job, 2)
    visit "/jobs?sort=interest"
    
    within("div.col-md-4:nth-of-type(1)") do
      within("h3:nth-of-type(1)") do
        expect(page).to have_content(job1.level_of_interest)
      end
    end
  end

end