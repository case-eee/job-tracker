require 'rails_helper'

describe "When a user visits a company page and clicks on 'Edit' for the first job" do
  it "they can edit the job" do
    company = Company.create(name: "ESPN")
    category1 = Category.create(title: "Business")
    category2 = Category.create(title: "HR")
    category2_id = category2.id.to_s
    job = company.jobs.create(title: "CEO",
                                description: "The boss.",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category2.id}")
    visit company_jobs_path(company)

    within(".job_#{job.id}") do
      click_link "Edit"
    end

    fill_in "job[title]", with: "HR Manager"
    fill_in "job[description]", with: "Talk to people."
    fill_in "job[level_of_interest]", with: 5
    fill_in "job[city]", with: "Seattle"
    within '#job_category_id' do
      find("option[value='#{category2_id}']").select_option
    end
    click_button "Submit"

    expect(current_path).to eq(company_job_path(company,job))
    expect(page).to have_content("HR Manager")
    expect(page).to have_content("Talk to people.")
    expect(page).to have_content("5")
    expect(page).to have_content("Seattle")
    expect(page).to have_content("HR")

    expect(page).to_not have_content("CEO")
    expect(page).to_not have_content("The boss.")
    expect(page).to_not have_content("2")
    expect(page).to_not have_content("Denver")
    expect(page).to_not have_content("Business")
  end
end

describe "When a user visits a job page and clicks on 'Edit'" do
  it "they can edit the job" do
    company = Company.create(name: "ESPN")
    category1 = Category.create(title: "Business")
    category2 = Category.create(title: "HR")
    category2_id = category2.id.to_s
    job = company.jobs.create(title: "CEO",
                                description: "The boss.",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category2.id}")
    visit company_job_path(company, job)

    click_link "Edit"

    fill_in "job[title]", with: "HR Manager"
    fill_in "job[description]", with: "Talk to people."
    fill_in "job[level_of_interest]", with: 5
    fill_in "job[city]", with: "Seattle"
    within '#job_category_id' do
      find("option[value='#{category2_id}']").select_option
    end
    click_button "Submit"

    expect(current_path).to eq(company_job_path(company,job))
    expect(page).to have_content("HR Manager")
    expect(page).to have_content("Talk to people.")
    expect(page).to have_content("5")
    expect(page).to have_content("Seattle")
    expect(page).to have_content("HR")

    expect(page).to_not have_content("CEO")
    expect(page).to_not have_content("The boss.")
    expect(page).to_not have_content("2")
    expect(page).to_not have_content("Denver")
    expect(page).to_not have_content("Business")
  end
end
