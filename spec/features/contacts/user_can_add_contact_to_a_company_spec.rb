require 'rails_helper'

RSpec.describe "User can add contact to a company" do
  scenario "When all contact details are filled in" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    new_contact_name = "Test name"
    new_contact_position = "Test position"
    new_contact_email = "Testemail@whatever.com"

    visit company_path(company)

    fill_in "contact[name]", with: new_contact_name
    fill_in "contact[position]", with: new_contact_position
    fill_in "contact[email]", with: new_contact_email

    click_on "Save"

    expect(company.contacts.count).to eq(1)
    contact = Contact.first
    expect(contact.name).to eq(new_contact_name)
    expect(page).to have_content(new_contact_name)
    expect(page).to have_content(new_contact_position)
    expect(page).to have_content(new_contact_email)
  end
  scenario "Except when not all details in the contact form are completed" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job

    visit company_path(company)

    click_on "Save"

    expect(company.contacts.count).to eq(0)
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Position can't be blank")
    expect(page).to have_content("Email can't be blank")
  end
  scenario "When after error message all contact details are filled in" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    new_contact_name = "Test name"
    new_contact_position = "Test position"
    new_contact_email = "Testemail@whatever.com"

    visit company_path(company)

    click_on "Save"

    fill_in "contact[name]", with: new_contact_name
    fill_in "contact[position]", with: new_contact_position
    fill_in "contact[email]", with: new_contact_email

    click_on "Save"

    expect(company.contacts.count).to eq(1)
    contact = Contact.first
    expect(contact.name).to eq(new_contact_name)
    expect(page).to have_content(new_contact_name)
    expect(page).to have_content(new_contact_position)
    expect(page).to have_content(new_contact_email)
  end
end