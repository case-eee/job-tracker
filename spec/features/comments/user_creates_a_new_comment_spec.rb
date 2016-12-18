require 'rails_helper'

describe "User creates a new comment" do
  scenario "adds comment to job" do
    company = Company.create(name: "Pivotal Labs")
    category = Category.create(title: "sample")
    job = Job.create(title: "Web Developer", company_id: company.id, description:"Rails", level_of_interest: 10, city: "Denver", category_id: category.id )

    visit companies_path

    click_on "Pivotal Labs"

    click_on "Web Developer"

    fill_in "Content", with: "Finished first trial sprint"

    click_on "Create Comment"
    
    expect(page).to have_content "Finished first trial sprint"
    expect(page).to have_content "less than a minute ago"
  end
end
