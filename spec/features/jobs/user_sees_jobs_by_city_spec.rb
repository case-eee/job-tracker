require "rails_helper"

describe "A User visits city show page" do
  scenario "sees all jobs for a partiuclar city" do
    company  = Company.create(name: "North Face")
    category = Category.create(title: "sample")
    job      = Job.create(title: "Software Developer", level_of_interest: 7, city: "Denver", category_id: category.id, company_id: company.id )

    visit "/jobs?sort=Denver"

    expect(page).to have_content "All Jobs for Denver"
    expect(page).to have_content "Software Developer"
  end
end
