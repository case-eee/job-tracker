require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = Company.create(name: "ESPN", city: "LA")
    visit companies_path

    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("ESPN was successfully deleted!")
    expect(page).to_not have_content("LA")
  end

  scenario "a user tries to delete a company with jobs" do
    company = Company.create(name: "ESPN", city: "LA")
    company.jobs.create(title: "Developer", level_of_interest: 70)
    visit companies_path

    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("All jobs must be deleted")
    expect(page).to have_content("LA")
  end
end
