require 'rails_helper'

describe "User delete existing job" do
  it "a user can delete a job" do
    company = create(:company)
    company.jobs << create_list(:job, 4)
    visit(company_jobs_path(company))
    expect(page).to have_content("Title_1 at Company 1")
    expect(company.jobs.count).to eq(4)
    click_on("Delete", match: :first)
    expect(company.jobs.count).to eq(3)
  end

  it "a user should be redirected to the company_jobs page" do
    company = create(:company)
    company.jobs << create_list(:job, 4)
    visit(company_jobs_path(company))
    click_on("Delete", match: :first)

    expect(page).to have_current_path(company_jobs_path(company))
  end
end
