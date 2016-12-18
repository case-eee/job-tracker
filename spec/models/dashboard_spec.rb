require 'rails_helper'

describe Dashboard do
  it "returns count of jobs by level of interest" do
    create(:job)
    create_list(:job, 2, level_of_interest: 20)
    dashboard = Dashboard.new

    expect(dashboard.job_count_by_interest(10)).to eq 1
    expect(dashboard.job_count_by_interest(20)).to eq 2
  end

  it "returns top three companies by level of interest" do
    company_1, company_2, company_3, company_4 = create_list(:company, 4)
    create(:job, level_of_interest: 60, company: company_1)
    create(:job, level_of_interest: 40, company: company_2)
    create(:job, level_of_interest: 10, company: company_3)
    create(:job, level_of_interest: 50, company: company_4)
    dashboard = Dashboard.new

    expect(dashboard.top_three_companies_by_interest_level).to eq [company_1, company_4, company_2]
  end

  it "returns count of jobs by location" do
    create_list(:job, 2)
    create_list(:job, 4, city: "New York")
    dashboard = Dashboard.new

    expect(dashboard.job_count_by_location("Denver")).to eq 2
    expect(dashboard.job_count_by_location("New York")).to eq 4
  end
end
