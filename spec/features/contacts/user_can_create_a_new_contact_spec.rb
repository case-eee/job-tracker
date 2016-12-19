require 'rails_helper'

describe "When a user visits a company page and clicks on 'Add a contact'" do
  before do
    @company = Company.create(name: "ESPN")
    visit company_path(@company)
    click_on "Add a Contact"
  end

  it "they can create a new contact" do
    fill_in "contact[first_name]", with: "Jane"
    fill_in "contact[last_name]", with: "Doe"
    fill_in "contact[position]", with: "CEO"
    fill_in "contact[email]", with: "jane@company.com"

    click_button "Submit"

    expect(current_path).to eq(company_contact_path(@company,Contact.last))
    expect(page).to have_content("Jane")
    expect(page).to have_content("Doe")
    expect(page).to have_content("CEO")
    expect(page).to have_content("jane@company.com")
  end

  it "they see an error message if they don't input all required fields" do
    click_button "Submit"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Position can't be blank")
    expect(page).to have_content("Email can't be blank")
  end
end
