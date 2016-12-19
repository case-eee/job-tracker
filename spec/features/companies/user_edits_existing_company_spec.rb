require 'rails_helper'

describe "When a user visits '/companies' and clicks on 'Edit' for the first company" do
  it "they can edit the company" do
    company = Company.create(name: "ESPN")
    visit companies_path
    within(".company_#{company.id}") do
      click_link "EDIT"
    end

    fill_in "company[name]", with: "EA Sports"
    click_button "Submit"

    expect(page).to have_content("EA Sports updated!")
    expect(Company.count).to eql(1)
    expect(current_path).to eq(company_path(Company.last))
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("ESPN")
  end
end
