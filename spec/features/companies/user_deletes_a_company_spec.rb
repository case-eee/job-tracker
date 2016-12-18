require 'rails_helper'

describe "company #destroy" do

  before {FactoryGirl.reload}

  scenario "a user can delete a company" do
    company = create(:company, name: "ESPN")
    visit companies_path

    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("ESPN was successfully deleted!")
  end
end
