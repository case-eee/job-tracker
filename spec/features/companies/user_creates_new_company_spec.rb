require 'rails_helper'

describe "When a user visits '/companies' and clicks on 'Add Company'" do
  before do
    @company = Company.create(name: "Turing")
    visit companies_path
    click_on "Add Company"
  end

  it "they can create a new company" do
    fill_in "company[name]", with: "ESPN"
    click_button "Submit"

    expect(current_path).to eq(company_path(Company.last))
    expect(page).to have_content("ESPN")
    expect(Company.count).to eq(2)
  end

  it "they see an error message if they don't input a name" do
    click_button "Submit"

    expect(page).to have_content "Name can't be blank"
  end

  it "they see an error message if they input a name that already exists" do
    fill_in "company[name]", with: "Turing"
    click_button "Submit"

    expect(page).to have_content "Name has already been taken"
    expect(Company.count).to eq(1)
  end
end
