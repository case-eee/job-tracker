require 'rails_helper'

describe "User can delete existing company" do
  scenario "from the Company Index page" do
    company = create(:company)
    visit companies_path

    click_on "Delete"

    expect(current_path).to eq(companies_path)
    expect(page).not_to have_link company.name
    expect(Company.count).to eq(0)
  end
  scenario "from the Company details (Show) page" do
    company1, company2 = create_list(:company, 2)
    visit company_path(company1)

    click_on "Delete"

    expect(current_path).to eq(companies_path)
    expect(page).not_to have_link company1.name
    expect(Company.count).to eq(1)
  end
end
