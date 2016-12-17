require 'rails_helper'

describe "User creates contact" do
  scenario "with valid attributes" do
    company = create(:company)

    visit company_path(company)

    fill_in "contact[name]", with: "Luke Skywalker"
    fill_in "contact[position]", with: "Savior of galaxy"
    fill_in "contact[email]", with: "theforce@gmail.com"

    click_on "Create Contact"

    expect(current_path).to eq company_jobs_path(company)
    expect(page).to have_content "Luke Skywalker"
    expect(page).to have_content "Savior of galaxy"
    expect(page).to have_content "theforce@gmail.com"
    expect(page).to have_content "#{company.contacts.last.name} successfully created"
    expect(company.contacts.count).to eq 1
  end

  scenario "with invalid attributes" do
    company = create(:company)

    visit company_path(company)
    click_on "Create Contact"

    expect(page).to have_content "Name can't be blank"
  end
end