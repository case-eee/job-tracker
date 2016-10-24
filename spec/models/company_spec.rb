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

  describe ".sort_by_city" do
    let (:companies) { create_list(:company, 2) }
    sorted_companies = Company.sort_by_city

    it "companies by city in alphabetic order" do
      expect(companies.first.city).to eq("Phoenix")
      expect(companies.second.city).to eq("Denver")
      expect(sorted_companies.first.city).to eq("Denver")
      expect(sorted_companies.second.city).to eq("Phoenix")
    end
  end

  describe ".sort_by_city" do
    let (:build_companies) { create_list(:companies_with_jobs, 6) }

    it "companies by city in alphabetic order" do
      build_companies
      breakdowns = Company.breakdown_by_location

      expect(breakdowns.first).to eq("Denver: 6")
      expect(breakdowns.second).to eq("Phoenix: 6")
      expect(breakdowns.third).to eq("Chicago: 6")
    end
  end

  describe ".top_three_by_level_of_interest" do
    let (:build_companies) { create_list(:companies_with_jobs, 6) }

    it "companies by city in alphabetic order" do
      build_companies
      rankings = Company.top_three_by_level_of_interest

      expect(rankings.first).to eq("14 Name: 30.0")
      expect(rankings.second).to eq("16 Name: 30.0")
      expect(rankings.third).to eq("13 Name: 30.0")
    end
  end
end
