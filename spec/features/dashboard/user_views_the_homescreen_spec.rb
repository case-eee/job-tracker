require 'rails_helper'

describe "User sees the home page" do
  scenario "a user sees the home page" do

    visit root_path

    expect(page).to have_content("Welcome to Job Tracker!")
    expect(page).to have_link("Job Categories", href: categories_path)
    expect(page).to have_link("Companies", href: companies_path)
    expect(page).to have_link("Analysis", href: dashboard_index_path)
  end

end
