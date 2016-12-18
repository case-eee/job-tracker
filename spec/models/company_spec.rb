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
  end
end
