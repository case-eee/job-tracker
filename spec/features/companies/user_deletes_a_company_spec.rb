require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company from the Company Index page" do
    company = create(:company)
    visit companies_path

    click_on "Delete"

    expect(page).not_to have_link company.name
    expect(Company.count).to eq(0)
  end
end
