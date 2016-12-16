require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category1, category2 = create_list(:category, 2)
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    find("#job_category_id").find(:xpath, "option[2]").select_option
    click_on "Create Job"
    
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end

  scenario "it does not save if missing title" do
    category1, category2 = create_list(:category, 2)
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select category1.title, from: 'job[category_id]'
    click_button "Create"

    expect(page).to have_content("Title can't be blank")
  end

  scenario "it does not save if category is not selected" do
    category1, category2 = create_list(:category, 2)
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    click_button "Create"

    expect(page).to have_content("Category can't be blank")
  end
end
