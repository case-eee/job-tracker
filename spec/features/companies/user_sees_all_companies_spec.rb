require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    create_list(:company, 5)
    visit companies_path

    expect(page).to have_content("Company 1")
  end

end
