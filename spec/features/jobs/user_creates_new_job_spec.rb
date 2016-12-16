require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)


    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    # within "#job_category_id" do
    #   select("option[value='2'")
    # end
    x = find_field("job[category_id]").value
    # x = find_by_id("job_category_id", :text => "Software Engineering")
    # page.select(:text => "Software Engineering", :from => "job[category_id]")
    binding.pry
    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_select('job_category_id',selected: "Option 2")
    expect(page).to have_content("Software Engineering")
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
