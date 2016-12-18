require 'rails_helper'

describe "User can see dashboard page" do
  scenario "user can navigate to dashboard from nav" do
    visit companies_path

    within("nav") do
      click_on "dashboard"
    end

    expect(current_path).to eq(dashboard_path)
  end

  scenario "user can see dashboard sorted by interest" do
    skip
  end

  scenario "user can see three top companies" do
    skip
  end

  scenario "user can see corresponding level of interest" do
    skip
  end

  scenario "user can see a count of jobs by location" do
    skip
  end
end
