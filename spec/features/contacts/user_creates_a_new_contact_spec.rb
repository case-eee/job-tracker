require 'rails_helper'

describe "User creates a new contact" do
 scenario "adds contact to company" do
   company = Company.create(name: "Google")
   category = Category.create(name: "Technology")
   job = Job.create(title: "Web Developer", company_id: company.id, description:"Rails", level_of_interest: 10, city: "Denver", category: category )

   visit company_jobs_path(company)
   fill_in "Full name", with: "John Smith"
   fill_in "Position", with: "Accountant"
   fill_in "Email", with: "johnsmith@yahoo.com"

   click_on "Create Contact"

   expect(page).to have_content "John Smith"
   expect(page).to have_content "Accountant"
   expect(page).to have_content "johnsmith@yahoo.com"
 end
end
