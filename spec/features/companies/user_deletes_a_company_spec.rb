require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company from the Company Index page" do
    company = Company.create(name: "ESPN")
    visit companies_path

    click_on "Delete"

    visit companies_path

    expect(page).not_to have_content(company.name)
    expect(Company.count).to eq(0)
  end
end
