require 'rails_helper'

describe "User can sort jobs by location" do
  scenario "user visits sort by location page" do
    job1, job2, job3 = create_list(:jobs, 3)
    job1.city = "Denver"
    job2.city = "San Francisco"
    job3.city = "Atlanta"

    visit("/jobs?sort=location")

    expect(page).to have_content("Denver")
    expect(page).to have_content("San Francisco")
    expect(page).to have_content("Atlanta")
  end
end
