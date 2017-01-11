require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = Company.create(name: "ESPN")
    visit companies_path

    click_link "Delete"

    expect(page).to have_content("ESPN was successfully deleted!")
    expect(Company.count).to eq(0)
  end
end
