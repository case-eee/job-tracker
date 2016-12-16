require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = create_list(:category, 5)
    visit new_company_job_path(company)
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    within "#job_category_id" do
      select("Category_title_1")
    end
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Category_title_1")
  end

  describe "validations" do
    it "must have a title" do
      company = create(:company)
      visit new_company_job_path(company)

      fill_in("job[title]", with: nil)
      fill_in("job[description]", with: "So fun!")
      fill_in("job[level_of_interest]", with: 80)
      fill_in("job[city]", with: "Denver")
      click_button("Create Job")

      expect(Job.count).to eq(0)
    end

    it "must have a level of interest" do
      company = create(:company)
      visit new_company_job_path(company)

      fill_in("job[title]", with: "Janitor")
      fill_in("job[description]", with: "So fun!")
      fill_in("job[level_of_interest]", with: nil)
      fill_in("job[city]", with: "Denver")
      click_button("Create")

      expect(Job.count).to eq(0)

    end
    it "must have a city" do
      company = create(:company)
      visit new_company_job_path(company)

      fill_in("job[title]", with: "Janitor")
      fill_in("job[description]", with: "So fun!")
      fill_in("job[level_of_interest]", with: 80)
      fill_in("job[city]", with: nil)
      click_button("Create")

      expect(Job.count).to eq(0)
    end
  end
end
