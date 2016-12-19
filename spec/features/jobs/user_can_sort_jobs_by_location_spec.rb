require 'rails_helper'

describe "User can sort jobs by location" do
  scenario "user visits sort by location page" do
    job1 = create(:job, city: "San Francisco" )
    job2 = create(:job, city: "Atlanta" )
    job3 = create(:job)

    visit("/jobs?sort=location")

    expect(page).to have_content("Denver")
    expect(page).to have_content(1)
    expect(page).to have_content("San Francisco")
    expect(page).to have_content("Atlanta")
  end
end
