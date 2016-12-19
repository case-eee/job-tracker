require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = create(:category)
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        category = create(:category)
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        category = create(:category)
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a category" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, city: "hey")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        category = create(:category)
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end

  describe ".sort_by" do
    it "returns all jobs sorted by location" do
      create_list(:job, 10, city: "New York")
      create_list(:job, 10, city: "Boulder")
      create_list(:job, 10, city: "Denver")


      expect((Job.sort_by(:city)[0]).city).to eql "Boulder"
      expect((Job.sort_by(:city)[9]).city).to eql "Boulder"
      expect((Job.sort_by(:city)[19]).city).to eql "Denver"
      expect((Job.sort_by(:city)[-1]).city).to eql "New York"
    end
  end

  describe ".count_by_location" do
    it "returns all jobs conted by location" do
      create_list(:job, 5, city: "New York")
      create_list(:job, 10, city: "Boulder")
      create_list(:job, 15, city: "Denver")

      expect(Job.count_by_location["Boulder"]).to eql 10
      expect(Job.count_by_location["Denver"]).to eql 15
    end
  end

  describe ".count_by_interest" do
    it "returns all jobs counted by level of interest" do
      create_list(:job, 5, level_of_interest:10)
      create_list(:job, 10, level_of_interest:50)
      create_list(:job, 15, level_of_interest:99)
      
      expect(Job.count_by_interest[10]).to eql 5
      expect(Job.count_by_interest[99]).to eql 15
    end
  end

  describe ".companies_by_interest" do
    it "returns the top 3 companies ranked by averages level of interest with their averags levels" do
      company1 = create(:company_with_jobs)
      average1 = company1.jobs.average(:level_of_interest).to_f
      company2 = create(:company_with_jobs)
      average2 = company2.jobs.average(:level_of_interest).to_f
      company3 = create(:company_with_jobs)
      average3 = company3.jobs.average(:level_of_interest).to_f
      company4 = create(:company_with_jobs)
      average4 = company4.jobs.average(:level_of_interest).to_f
      max = [average1, average2, average3, average4].max

      expect(Job.companies_by_interest.count).to eql 3
      expect(Job.companies_by_interest.first.last.to_f).to eql max
    end
  end

end
