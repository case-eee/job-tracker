require 'rails_helper'

describe "When a user visits a company page and clicks on 'Edit' for the first contact" do
  it "they can edit the contact" do
    company = Company.create(name: "ESPN")
    contact = company.contacts.create(first_name: "Jane",
                                          last_name: "Doe",
                                          position: "CEO",
                                          email: "jane@company.com")
    visit company_contacts_path(company)

    within(".contact_#{contact.id}") do
      click_on "Edit"
    end

    fill_in "contact[first_name]", with: "John"
    fill_in "contact[last_name]", with: "Smith"
    fill_in "contact[position]", with: "HR Manager"
    fill_in "contact[email]", with: "john@company.com"
    click_button "Submit"

    expect(current_path).to eq(company_contact_path(company,contact))
    expect(page).to have_content("John Smith")
    expect(page).to have_content("HR Manager")
    expect(page).to have_content("john@company.com")

    expect(page).to_not have_content("Jane Doe")
    expect(page).to_not have_content("CEO")
    expect(page).to_not have_content("jane@company.com")
  end
end

describe "When a user visits a contact page and clicks on 'Edit'" do
  it "they can edit the contact" do
    company = Company.create(name: "ESPN")
    contact = company.contacts.create(first_name: "Jane",
                                          last_name: "Doe",
                                          position: "CEO",
                                          email: "jane@company.com")
    visit company_contact_path(company, contact)

    click_on "Edit"

    fill_in "contact[first_name]", with: "John"
    fill_in "contact[last_name]", with: "Smith"
    fill_in "contact[position]", with: "HR Manager"
    fill_in "contact[email]", with: "john@company.com"
    click_button "Submit"

    expect(current_path).to eq(company_contact_path(company,contact))
    expect(page).to have_content("John Smith")
    expect(page).to have_content("HR Manager")
    expect(page).to have_content("john@company.com")

    expect(page).to_not have_content("Jane Doe")
    expect(page).to_not have_content("CEO")
    expect(page).to_not have_content("jane@company.com")
  end
end
