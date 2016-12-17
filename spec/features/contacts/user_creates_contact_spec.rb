require 'rails_helper'

describe "User creates contact" do
  scenario "with valid attributes" do
    company = create(:company)

    visit company_path(company)

    fill_in "contact[name]", with: "Luke Skywalker"
    fill_in "contact[position]", with: "Savior of galaxy"
    fill_in "contact[email]", with: "theforce@gmail.com"

    click_on "Create Contact"

    expect(current_path).to eq company_path(company)
    expect(company.contacts.count).to eq 1
    expect(page).to have_content "Luke Skywalker"
    expect(page).to have_content "Savior of Galaxy"
    expect(page).to have_content "theforce@gmail.com"
  end

  scenario "with invalid attributes" do
    company = create(:company)

    visit company_path(company)

    click_on "Create Contact"

    expect(page).to have_content "Name can't be blank"
  end
end