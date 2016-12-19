require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = Category.create(title: "Web Development")
    category_id = category.id.to_s
    company = Company.create(name: "ESPN")
    visit new_company_job_path(company)
    
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    within '#job_category_id' do
      find("option[value='#{category_id}']").select_option
    end

    click_button "Submit"

    expect(current_path).to eq(company_job_path(company,Job.last))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
