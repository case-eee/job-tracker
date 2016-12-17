require 'rails_helper'

describe "User creates a new job" do
  before do
    @company = create(:company, name: "ESPN")
    @category = create_list(:category, 5)
    visit new_company_job_path(@company)
  end

  scenario "a user can create a new job" do
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select("Category_title_2")

    click_button("Create Job")
    expect(current_path).to eq("/companies/#{@company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Category_title_2")
  end

  describe "validations" do
    before do
      @company = create(:company)
      visit new_company_job_path(@company)
    end
    
    it "must have a title" do
      fill_in("job[title]", with: nil)
      fill_in("job[description]", with: "So fun!")
      fill_in("job[level_of_interest]", with: 80)
      fill_in("job[city]", with: "Denver")
      click_button("Create Job")

      expect(Job.count).to eq(0)
    end

    it "must have a level of interest" do
      fill_in("job[title]", with: "Janitor")
      fill_in("job[description]", with: "So fun!")
      fill_in("job[level_of_interest]", with: nil)
      fill_in("job[city]", with: "Denver")
      click_button("Create")

      expect(Job.count).to eq(0)
    end

    it "must have a city" do
      fill_in("job[title]", with: "Janitor")
      fill_in("job[description]", with: "So fun!")
      fill_in("job[level_of_interest]", with: 80)
      fill_in("job[city]", with: nil)
      click_button("Create")

      expect(Job.count).to eq(0)
    end
  end
end
