require 'rails_helper'

describe "job #index" do

  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
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
