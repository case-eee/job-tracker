require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      before do
        @company = Company.create(name: "ESPN")
        @category = Category.create(title: "Web Development")
      end

      it "is invalid without a title" do
        job = @company.jobs.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: "#{@category.id}")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = @company.jobs.new(title: "Developer", description: "Wahoo", city: "Denver", category_id: "#{@category.id}")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = @company.jobs.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category_id: "#{@category.id}")
        expect(job).to be_invalid
      end

      it "is invalid without a category_id" do
        job = @company.jobs.new(title: "Developer", description: "Wahoo", level_of_interest: 80, city: "Denver")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, city, and category" do
        company = Company.create(name: "ESPN")
        category = Category.create(title: "Web Development")
        job = company.jobs.new(title: "Developer", level_of_interest: 40, city: "Denver", category_id: "#{category.id}")
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company and a category" do
      company = Company.create(name: "ESPN")
      category = Category.create(title: "Web Development")
      job = company.jobs.new(title: "Software", level_of_interest: 70, description: "Wahooo", category_id: "#{category.id}")
      expect(job).to respond_to(:company)
      expect(job).to respond_to(:category)

    end
  end
end
