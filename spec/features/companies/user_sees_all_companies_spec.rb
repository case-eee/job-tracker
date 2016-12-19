require 'rails_helper'

describe "When a user visits '/companies'" do
  before do
    @company = Company.create(name: "RockTenn")
    @company_two = Company.create(name: "WestRock")
    visit companies_path
  end

  it "they see all the companies" do
    expect(page).to have_content("RockTenn".upcase)
    expect(page).to have_content("WestRock".upcase)
  end

  it "they are directed to the individual company page when they click on the company" do
    click_on "RockTenn".upcase

    expect(current_path).to eq(company_path(@company))
    expect(page).to have_content("RockTenn".upcase)
  end

end
