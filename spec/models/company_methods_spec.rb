require 'rails_helper'

describe "Company" do
  context "#average_level_of_interest" do
    scenario "for many jobs" do

      company = create(:company_with_jobs)
      sum_of_interest = company.jobs.reduce(0) {|sum, job| sum += job.level_of_interest}
      expected = average_level_of_interest = sum_of_interest.to_f / company.jobs.count

      expect(company.average_level_of_interest).to eq expected.round(2)
    end

    scenario "for zero jobs" do
      
      company = create(:company)

      expect(company.average_level_of_interest).to eq 0
    end
  end

  context "#top_companies(amount)" do
    scenario "top one company" do
      company = create(:company_with_jobs)
      expected = [company]

      expect(Company.top_companies(1)).to eq [company]
    end

    scenario "top three for many companies" do

      companies = create_list(:company_with_jobs, 4)
      
      expected = companies.sort_by do |company|
        company.average_level_of_interest
      end.reverse[0..2]

      expect(Company.top_companies(3)).to eq expected
    end

    scenario "for no companies" do
      expected = []

      expect(Company.top_companies(3)).to eq expected
    end
  end
end