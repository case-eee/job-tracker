require 'rails_helper'

describe "User creates a new contact" do
  scenario "adds contact to company" do
    company = Company.create(name: "Pivotal Labs")
    category = Category.create(title: "sample")
    job = Job.create(title: "Web Developer", company_id: company.id, description:"Rails", level_of_interest: 10, city: "Denver", category_id: category.id )

    visit company_jobs_path(company)
    fill_in "Name", with: "George Apple"
    fill_in "Position", with: "Hiring manager"
    fill_in "Email", with: "sample@yahoo.com"

    click_on "Create Contact"

    expect(page).to have_content "George Apple"
    expect(page).to have_content "Hiring manager"
    expect(page).to have_content "sample@yahoo.com"
  end
end
