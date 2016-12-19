require 'rails_helper'

describe "User visits job show page" do
  scenario "they can create a new comment" do
    company = create(:company_with_jobs)
    visit company_job_path(company, company.jobs.first)

    fill_in "Content", :with => "This is a great job!"

    click_button "Submit"

    expect(current_path). to eq company_job_path(company, company.jobs.first)
    expect(page).to have_content "This is a great job!"
    expect(Comment.count).to eq(1)
  end
end

