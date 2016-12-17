require 'rails_helper'

describe "User can edit details of existing job" do
  scenario "page shown correctly" do
    company = Company.create(name: "ESPN")
    category1, category2 = create_list(:category, 2)
    new_job_title = "Developer"
    new_job_description = "So fun!"
    new_job_level_of_interest = "80"
    new_job_city = "Denver, CO"

    visit new_company_job_path(company)
    
    expect(page).to have_field("job[title]")
    expect(page).to have_field("job[description]")
    expect(page).to have_field("job[level_of_interest]")
    expect(page).to have_field("job[city]")
    expect(page).to have_link("Add")
  end
  scenario "when completes all fields" do
    company = create(:company)
    category1, category2 = create_list(:category, 2)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    new_job_title = "Developer"
    new_job_description = "So fun!"
    new_job_level_of_interest = "80"
    new_job_city = "Denver, CO"

    visit company_job_path(company, job)

    click_on "Edit"

    fill_in "job[title]", with: new_job_title
    fill_in "job[description]", with: new_job_description
    fill_in "job[level_of_interest]", with: new_job_level_of_interest
    fill_in "job[city]", with: new_job_city

    click_on "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(Job.count).to eq(1)
    expect(page).to have_content(company.name)
    expect(page).to have_content(new_job_title)
    expect(page).to have_content(new_job_description)
    expect(page).to have_field("job_city", with: "#{new_job_city}", disabled: true)
    expect(page).to have_field("job_level_of_interest", with: "#{new_job_level_of_interest}", disabled: true)
  end
  scenario "except when required fields changed to empty" do
    company = create(:company)
    category1, category2 = create_list(:category, 2)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    new_job_title = "Developer"
    new_job_description = "So fun!"
    new_job_level_of_interest = "80"
    new_job_city = "Denver, CO"

    visit company_job_path(company, job)

    click_on "Edit"

    fill_in "job[title]", with: ""
    fill_in "job[description]", with: new_job_description
    fill_in "job[level_of_interest]", with: ""
    fill_in "job[city]", with: ""

    click_on "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(Job.count).to eq(1)
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Level of interest can't be blank")
    expect(page).to have_content("City can't be blank")
  end
  scenario "when completes all fields after error messages" do
    company = create(:company)
    category1, category2 = create_list(:category, 2)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    new_job_title = "Developer"
    new_job_description = "So fun!"
    new_job_level_of_interest = "80"
    new_job_city = "Denver, CO"

    visit company_job_path(company, job)

    click_on "Edit"

    fill_in "job[title]", with: ""
    fill_in "job[description]", with: new_job_description
    fill_in "job[level_of_interest]", with: ""
    fill_in "job[city]", with: ""

    click_on "Update"

    fill_in "job[title]", with: new_job_title
    fill_in "job[description]", with: new_job_description
    fill_in "job[level_of_interest]", with: new_job_level_of_interest
    fill_in "job[city]", with: new_job_city

    click_on "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(Job.count).to eq(1)
    expect(page).to have_content(company.name)
    expect(page).to have_content(new_job_title)
    expect(page).to have_content(new_job_description)
    expect(page).to have_field("job_city", with: "#{new_job_city}", disabled: true)
    expect(page).to have_field("job_level_of_interest", with: "#{new_job_level_of_interest}", disabled: true)
  end
end