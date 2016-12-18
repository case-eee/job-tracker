require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a category id" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, city: "Denver")
      end
    end

    context "valid attributes" do
      it "is valid with a all attributes" do
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", category_id: 1)
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
      job = create(:job)
      expect(job).to respond_to(:comments)
    end

    it "associated comments are destroyed" do
      job = create(:job)
      comment = create(:comment, job: job)

      expect {job.destroy}.to change {Comment.count}.by(-1)
    end
  end

  describe "sorting" do
    it "by city" do
      job_1, job_2 = create_list(:job, 2, city: "Denver")
      job_3 = create(:job, city: "Austin")
      job_4 = create(:job, city: "New York")

      expect(Job.by_location).to eq [job_3, job_1, job_2, job_4]
    end

    it "by interest" do
      job_1, job_2 = create_list(:job, 2, level_of_interest: 45)
      job_3 = create(:job, level_of_interest: 40)
      job_4 = create(:job, level_of_interest: 50)

      expect(Job.by_interest).to eq [job_4, job_1, job_2, job_3 ]
    end
  end

  describe "filter" do
    it "by location" do
      create_list(:job, 3, city: "Austin")
      create_list(:job, 4, city: "Denver")
      expected = create_list(:job, 5, city: "New York")

      expect(Job.in("New York")).to eq expected
    end
  end
end
