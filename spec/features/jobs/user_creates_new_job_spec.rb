require 'rails_helper'

describe "job #new" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    @company = create(:company, name: "ESPN")
    @city = create_list(:city,5)
    @category = create_list(:category, 5)
    visit new_company_job_path(@company)
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    find('#job_city_id').find(:xpath, 'option[2]').select_option
    select("Category_title_2")
  end

  scenario "a user can create a new job" do
    click_button("Create Job")
    expect(current_path).to eq("/companies/#{@company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("City_2")
    expect(page).to have_content("Category_title_2")
  end

  it "the page should also have a new category link" do
    expect(page).to have_button("Create a new category")
  end

end

describe "validations" do
  before do
    FactoryGirl.reload
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    @city = create_list(:city,5)
    @company = create(:company)
    visit new_company_job_path(@company)
  end
    it "must have a title" do
    fill_in("job[title]", with: nil)
    fill_in("job[description]", with: "So fun!")
    fill_in("job[level_of_interest]", with: 80)
    find('#job_city_id').find(:xpath, 'option[2]').select_option
    click_button("Create Job")
        expect(Job.count).to eq(0)
  end
    it "must have a level of interest" do
    fill_in("job[title]", with: "Janitor")
    fill_in("job[description]", with: "So fun!")
    fill_in("job[level_of_interest]", with: nil)
    find('#job_city_id').find(:xpath, 'option[2]').select_option
    click_button("Create Job")

    expect(Job.count).to eq(0)
  end
end
