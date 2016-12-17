require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        category = Category.create(title: nil)

        expect(category).not_to be_valid
      end

      it "is invalid without unique title" do
        category1 = Category.create(title: "Dog")
        category2 = Category.create(title: "Dog")

        expect(category2).not_to be_valid
      end
    end

    context "with valid attributes" do
      it "is valid with a name" do
        category = Category.create(title: "Dog")

        expect(category).to be_valid
      end
    end

    describe "relationships" do
      it "has many jobs" do
        category = Category.create(title: "Dog")

        job1 = Job.create(title: "Wrangler",
                        description: "does stuff",
                        city: "Denver",
                        level_of_interest: 80)
        job2 = Job.create(title: "Psycologist",
                        description: "does stuff",
                        city: "Denver",
                        level_of_interest: 90)

        category.jobs << job1
        category.jobs << job2

        expect(category.jobs.count).to eq 2
        expect(category.jobs.first).to eq(job1)
        expect(job1.category_id).to eq(category.id)
        expect(job2.category_id).to eq(category.id)
      end
    end
  end
end
