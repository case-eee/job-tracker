require "rails_helper"

describe "User sees contacts section of a company" do
  scenario "a user adds a contact to a company" do
    company = Company.create(name: "ESPN", city: "LA")

    visit company_path(company)

    fill_in "contact[first_name]", with: "Anna"
    fill_in "contact[last_name]", with: "Dolan"
    fill_in "contact[position]", with: "Director of Cats"
    fill_in "contact[email]", with: "anna.dolan@gmail.com"
    click_button "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Director of Cats")
    expect(page).to have_content("anna.dolan@gmail.com")
  end

  scenario "a user deletes a contact" do
    company = Company.create(name: "ESPN", city: "LA")
    company.contacts.create(first_name: "Anna", last_name: "Dolan", position: "Director of Cats", email: "anna.dolan@gmail.com")

    visit company_path(company)

    expect(page).to have_content("Anna Dolan")

    click_link "Delete"

    expect(page).to_not have_content("Anna Dolan")
  end
end
