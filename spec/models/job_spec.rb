require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        job = Job.new(title: "Developer", level_of_interest: 40)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", category_id: 1)
      expect(job).to respond_to(:category)
    end
    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", category_id: 1)
      expect(job).to respond_to(:comments)
    end
  end

  describe ".sort_by_interest" do
    it "sorts jobs by level of interest" do
      jobs = create_list(:job, 3)

      sorted = Job.sort_by_interest

      expect(sorted.first.level_of_interest).to eq(10)
      expect(sorted.second.level_of_interest).to eq(20)
    end
  end

  describe ".breakdown_by_level_of_interest" do
    it "breaks down jobs by level of interest" do
      jobs = create_list(:job, 3)

      breakdowns = Job.breakdown_by_level_of_interest

      expect(breakdowns.first).to eq("20: 1")
      expect(breakdowns.second).to eq("60: 1")
    end
  end

  describe ".average_level_of_interest" do
    it "calculates average level of interest" do
      jobs = create_list(:job, 3)

      average = Job.average_level_of_interest

      expect(average).to eq(30)
    end
  end
end
