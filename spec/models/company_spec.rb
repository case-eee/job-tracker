require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new(city: "Denver")
        expect(company).to be_invalid
      end

      it "is invalid without a city" do
        company = Company.new(name: "Ericsson")
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox", city: "Denver")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name and city" do
        company = Company.new(name: "Dropbox", city: "Denver")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox", city: "Denver")
      expect(company).to respond_to(:jobs)
    end

    it "has many contacts" do
      company = Company.new(name: "Dropbox", city: "Denver")
      expect(company).to respond_to(:contacts)
    end
  end

  describe ".jobs_by_location" do
    it "returns an array" do
      Company.create(name: "Dropbox", city: "Denver")
      expect(Company.jobs_by_location).to be_a Array
    end

    it "returns a city with number of jobs" do
      company = Company.create(name: "Dropbox", city: "Denver")
      company.jobs.create(title: "Software", level_of_interest: 60, description: "Wahooo", company_id: company.id)
      company.jobs.create(title: "Softbear", level_of_interest: 70, description: "kgajhfk", company_id: company.id)
      expect(Company.jobs_by_location).to include(["Denver", 2])
    end
  end

  describe ".top_three_by_interest" do
    it "returns an array" do
      company = Company.create(name: "Dropbox", city: "Denver")
      Job.create(title: "Software", level_of_interest: 60, description: "Wahooo", company_id: company.id)
      Job.create(title: "Softbear", level_of_interest: 70, description: "kgajhfk", company_id: company.id)
      expect(Company.top_three_by_interest).to be_a Array
    end

    it "returns company name with average level of interest" do
      company = Company.create(name: "Dropbox", city: "Denver")
      Job.create(title: "Software", level_of_interest: 60, description: "Wahooo", company_id: company.id)
      Job.create(title: "Softbear", level_of_interest: 70, description: "kgajhfk", company_id: company.id)
      expect(Company.top_three_by_interest).to include(["Dropbox", 65])
    end
  end
end
