require "rails_helper"

describe "User visits the dashboard and sees analytics" do
  scenario "user sees a count of jobs by level of interest" do
    visit "/dashboard"

    expect(page).to have_content("Companies Dashboard")
    expect(page).to have_content("Top 3 Companies by Interest:")
    expect(page.find "ol li:nth-child(1)").to have_content("Good company")
    expect(page.find "ol li:nth-child(2)").to have_content("Meh company")
    expect(page.find "ol li:nth-child(3)").to have_content("Bad company")
  end

  scenario "user sees a count of jobs by location" do
    visit "/dashboard"

    expect(page).to have_content("Companies Dashboard")
    expect(page).to have_content("Number of Jobs per Location")
    expect(page).to have_content("Fort Collins : 2")
    expect(page).to have_content("Denver : 2")
    expect(page).to have_content("Colorado Springs : 1")
  end
end
