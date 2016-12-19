# require 'rails_helper'
#
# describe "User creates a new contact" do
#   scenario "a user can create a new contact" do
#     company = Company.create!(name: "ESPN")
#     job   = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
#
#     visit company_job_path(company, job)
#
#     fill_in "contact[full_name]", with: "Mike Johnson"
#     fill_in "contact[position]", with: "VP Development"
#     fill_in "contact[email]", with: "johnson@espn.org"
#     click_button "Create Contact"
#
#     expect(current_path).to eq(company_jobs_path(company))
#     expect(page).to have_content("Mike Johnson")
#     expect(page).to have_content("VP Development")
#     expect(page).to have_content("johnson@espn.org")
#   end
#
# end
