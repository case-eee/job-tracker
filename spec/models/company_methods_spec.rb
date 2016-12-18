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
end