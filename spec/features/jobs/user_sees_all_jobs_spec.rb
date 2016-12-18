require 'rails_helper'

describe "User sees all jobs" do

  before do
    FactoryGirl.reload
    @company = create(:company_jobs)
    visit company_path(@company)
  end

  it "a user sees all the jobs for a specific company" do
    @company.jobs.each do |job|
      expect(page).to have_content(job.title)
    end
    expect(@company.jobs.count).to eq(5)
  end
end
