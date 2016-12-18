require 'rails_helper'

describe Dashboard do
  it "returns count of jobs by level of interest" do
    create(:job)
    create_list(:job, 2, level_of_interest: 20)
    dashboard = Dashboard.new

    expect(dashboard.job_count_by_interest(10)).to eq 1
    expect(dashboard.job_count_by_interest(20)).to eq 2
  end

  it "returns average level of interest for company" do
    company = create(:company)
    create_list(:job, 3, level_of_interest: 50)
    create(:job, level_of_interest: 25, company: company)
    create_list(:job, 2, level_of_interest: 10, company: company)
    dashboard = Dashboard.new

    expect(dashboard.average_interest_for_company(company)).to eq 15
  end

  it "returns count of jobs by location" do
    create_list(:job, 2)
    create_list(:job, 4, city: "New York")
    dashboard = Dashboard.new

    expect(dashboard.job_count_by_location("Denver")).to eq 2
    expect(dashboard.job_count_by_location("New York")).to eq 4
  end
end
