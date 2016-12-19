require 'rails_helper'

describe "User can sort jobs by interest level" do
  scenario "user visits sort by interest level page" do
    job1 = create(:job, city: "San Francisco" )
    job2 = create(:job, city: "Atlanta" )
    job3 = create(:job)

    visit("/jobs?sort=level_of_interest")

    expect(page).to have_content(job1.level_of_interest)
    expect(page).to have_content(job2.level_of_interest)
    expect(page).to have_content(job3.level_of_interest)
  end
end
