require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = Company.create(name: "ESPN")
    visit companies_path

    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(Company.count).to eq(0)
    expect(page).to have_content("ESPN was successfully deleted!")
  end
end
