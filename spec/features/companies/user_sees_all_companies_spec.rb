require 'rails_helper'

describe "company #index" do

  before {FactoryGirl.reload}

  scenario "a user sees all the companies" do
    create_list(:company, 5)
    visit companies_path

    expect(page).to have_content("Company 1")
    expect(page).to have_content("Company 2")
    expect(page).to have_content("Company 3")
    expect(page).to have_content("Company 4")
    expect(page).to have_content("Company 5")
  end

end
