require 'rails_helper'

describe "User visits /jobs?sort=location and sees list of jobs in that city" do
  scenario "user visits /jobs?sort=location" do
    location = "Denver"
    visit "/jobs?sort=location"

    expect(page).to have_content("Jobs by Location")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Web Design")
  end
end
