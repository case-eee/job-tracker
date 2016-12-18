require 'rails_helper'

describe "User sees one company" do

  before {FactoryGirl.reload}
  
  scenario "a user sees a company" do
    company = create(:company_jobs)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Company 1")
    expect(page).to have_content("Title_1")
  end
end
