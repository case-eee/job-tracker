require 'rails_helper'

describe "User sees all companies" do
  scenario "in database" do
    company_one, company_two = create_list(:company, 2)

    visit companies_path

    expect(page).to have_content company_one.name
    expect(page).to have_content company_two.name
  end

end
