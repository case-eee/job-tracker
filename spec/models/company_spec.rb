require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
    it "has many contacts" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:contacts)
    end
  end

  describe "methods" do
    it "jobs list can be sorted by city" do
      company = create(:company)
      category1, category2 = create_list(:category, 2)
      job1, job2 = create_list(:job, 2)
      job1.category = Category.new
      job1.category = category1
      job1.save
      job2.category = Category.new
      job2.category = category2
      job2.save
      company.jobs << [job1, job2]
      cities = Job.all.pluck(:city).sort

      expect(company.jobs).to respond_to(:bycity)
      expect(company.jobs.bycity.first.city).to eq(cities.first)
      expect(company.jobs.bycity.last.city).to eq(cities.last)
    end
    it "returns list of top companies by average level of interest" do
      company1, company2 = create_list(:company, 2)
      category1, category2 = create_list(:category, 2)
      job1, job2, job3, job4 = create_list(:job, 4)
      job1.category = Category.new
      job1.category = category1
      job1.save
      job2.category = Category.new
      job2.category = category2
      job2.save
      company1.jobs << [job1, job2]
      company2.jobs << [job3, job4]
      company1_avg = company1.jobs.average(:level_of_interest)
      company2_avg = company2.jobs.average(:level_of_interest)
      loi_averages = [company1_avg, company2_avg].sort.reverse
      companies = {
        company1_avg => company1.name,
        company2_avg => company2.name
      }

      expect(Company.top_companies_by_average_level_of_interest.first[:name]).to eq(companies[loi_averages.first])
      expect(Company.top_companies_by_average_level_of_interest.first[:id]).to eq(Company.find_by(name: companies[loi_averages.first]).id)
      expect(Company.top_companies_by_average_level_of_interest.first[:average_level_of_interest]).to eq(loi_averages.first.to_f.round(2))
    end
  end
end
