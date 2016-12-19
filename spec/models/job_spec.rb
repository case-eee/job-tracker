require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = create(:job)
        job.title = nil
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = create(:job)
        job.level_of_interest = nil
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = create(:job)
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
    it "belongs to a company" do
      job = create(:job)
      expect(job).to respond_to(:company)
    end

    it "has many comments" do
      job = create(:job)
      expect(job).to respond_to(:comments)
    end
  end

  describe "analytics" do
    it "ranks jobs by level of interest" do
      job1 = create(:job)
      job2 = create(:job, level_of_interest: 1)

      jobs = Job.sort_by_level_of_interest
      expect(jobs.count).to eq(2)
      expect(jobs.first).to eq(job1)
    end

    it "delivers payload hash" do
      job1 = create(:job)
      job2 = create(:job, level_of_interest: 1)

      payload = Job.payload
      expect(payload.class).to eq(Hash)
    end

    it "ranks three companies with highest level of interest" do
      company = create(:company)
      company2 = create(:company)
      company3 = create(:company)

      job1 = create(:job, level_of_interest: 35)
      job2 = create(:job, level_of_interest: 55)

      job1.company_id = company.id
      job2.company_id = company.id

      job3 = create(:job, level_of_interest: 30)
      job4 = create(:job, level_of_interest: 40)

      job3.company_id = company2.id
      job4.company_id = company2.id

      top_companies = Job.top_companies

      expect(top_companies.count).to eq(3)
      expect(top_companies.first).to eq(company)
    end
  end
end
