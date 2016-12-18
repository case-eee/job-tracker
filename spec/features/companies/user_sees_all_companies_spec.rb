require 'rails_helper'

describe "When a user visits '/companies'" do
  before do
    @company = Company.create(name: "ESPN")
    @company_two = Company.create(name: "Disney")
    visit companies_path
  end

  it "they see all the companies" do
    expect(page).to have_content("ESPN")
    expect(page).to have_content("DISNEY")
  end

  it "they are directed to the individual company page when they click on the company" do
    click_on "ESPN"

    expect(current_path).to eq(company_path(@company))
    expect(page).to have_content("ESPN")
  end

end
