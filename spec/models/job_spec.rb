require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      let!(:job) { create(:job) }
      let!(:job2){ create(:job, level_of_interest: 1) }

      it "is invalid without a title" do
        job.title = nil
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job.level_of_interest = nil
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job.city = nil
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        job = create(:job)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    let!(:job) { create(:job) }
    let!(:job2){ create(:job, level_of_interest: 1) }

    it "belongs to a company" do
      expect(job).to respond_to(:company)
    end

    it "has many comments" do
      expect(job).to respond_to(:comments)
    end
  end

  describe "analytics" do
    let!(:job) { create(:job) }
    let!(:job2){ create(:job, level_of_interest: 1) }

    it "ranks jobs by level of interest" do
      jobs = Job.sort_by_level_of_interest
      expect(jobs.count).to eq(2)
      expect(jobs.first).to eq(job)
    end

    it "delivers payload hash" do
      payload = Job.payload
      expect(payload.class).to eq(Hash)
    end

    it "ranks three companies with highest level of interest" do
      company = create(:company_with_jobs)
      company2 = create(:company_with_jobs)
      company3 = create(:company_with_jobs)

      company.jobs.first.update(level_of_interest: 1000)

      top_companies = Job.top_companies
      expect(top_companies.count).to eq(3)
      expect(top_companies.first[0]).to eq(company)
    end
  end
end
