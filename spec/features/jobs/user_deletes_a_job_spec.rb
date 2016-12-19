require 'rails_helper'

describe "job #destroy" do
  before do
    FactoryGirl.reload
    @company = create(:company_jobs)
  end
  it "a user can delete a job" do
    visit(company_jobs_path(@company))

    expect(@company.jobs.count).to eq(5)
    click_on("Delete", match: :first)

    expect(@company.jobs.count).to eq(4)
  end

  it "a user should be redirected to the company_jobs page" do
    visit(company_jobs_path(@company))
    click_on("Delete", match: :first)

    expect(page).to have_current_path(company_jobs_path(@company))
  end
end
