require 'rails_helper'

RSpec.describe Company, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }

    it "is valid with a name" do
      company = Company.new(name: "Dropbox")
      expect(company).to be_valid
    end
  end

  context "associations" do
    it { should have_many(:jobs) }
  end

  it "destroys dependent jobs" do
    company = Company.create(name: "ESPN")
    category1 = Category.create(title: "Business")
    category2 = Category.create(title: "Finance")
    job1 = company.jobs.create(title: "CEO",
                                description: "The boss.",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category1.id}")
    job2 = company.jobs.create(title: "Accountant",
                                description: "Manage taxes",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category2.id}")


    expect(Job.count).to eql(2)

    company.destroy
    expect(Job.count).to eql(0)
  end

end
