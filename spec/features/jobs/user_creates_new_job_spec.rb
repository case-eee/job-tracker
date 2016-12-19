require 'rails_helper'

describe "When a user visits a company page and clicks on 'Add a job'" do
  before do
    @category = Category.create(title: "Web Development")
    @category_id = @category.id.to_s
    @company = Company.create(name: "ESPN")
    visit company_path(@company)
    click_on "Add a Job"
  end

  it "they can create a new job" do
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    within '#job_category_id' do
      find("option[value='#{@category_id}']").select_option
    end

    click_button "Submit"

    expect(current_path).to eq(company_job_path(@company,Job.last))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end

  it "they see an error message if they don't input all required fields" do
    click_button "Submit"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Level of interest can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("Category can't be blank")
  end
end
