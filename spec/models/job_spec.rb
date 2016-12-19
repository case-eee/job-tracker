require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, city and category_id" do
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", category_id: 100)
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
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:category)
    end
    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:comments)
    end
  end

  describe "methods" do
    it "counts number of jobs per level of interest" do
      job1, job2 = create_list(:job, 2)
      lois = [job1.level_of_interest, job2.level_of_interest].sort.reverse
      
      expect(Job.count_per_level_of_interest.count).to eq(2)
      expect(Job.count_per_level_of_interest.first[:level_of_interest]).to eq(lois.first)
      expect(Job.count_per_level_of_interest.last[:level_of_interest]).to eq(lois.last)
    end
    it "counts number of jobs per city" do
      job1, job2, job3 = create_list(:job, 3)
      cities = [job1.city, job2.city, job3.city].sort
      
      expect(Job.count_per_cities.count).to eq(3)
      expect(Job.count_per_cities[0][:name]).to eq(cities[0])
      expect(Job.count_per_cities[1][:name]).to eq(cities[1])
      expect(Job.count_per_cities[2][:name]).to eq(cities[2])
    end
  end
end
