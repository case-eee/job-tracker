require 'rails_helper'

describe "When user visits '/companies' and clicks 'Delete' for the first company" do
  it "the company is deleted" do
    @company = Company.create(name: "ESPN")
    visit companies_path

    within(".company_#{@company.id}") do
      click_link "DELETE"
    end

    expect(page).to have_content("ESPN was successfully deleted!")
    expect(Company.count).to eql(0)
  end
end

describe "When user visits a company page and clicks 'Delete'" do
  it "the company is deleted" do
    @company = Company.create(name: "ESPN")
    visit companies_path
    click_on "ESPN"

    expect(page).to have_content("ESPN")
    click_on "Delete"
    expect(page).to have_content("ESPN was successfully deleted!")
    expect(Company.count).to eql(0)
  end
end
