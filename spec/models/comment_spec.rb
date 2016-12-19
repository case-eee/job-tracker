require 'rails_helper'

RSpec.describe Comment, "associations", type: :model do
  it { should belong_to(:job) }
end

RSpec.describe Comment, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:job_id) }
  end

  it "is valid with content and job_id" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Business")
    job = company.jobs.create(title: "CEO",
                                description: "The boss.",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category.id}")
    comment = job.comments.create(content: "This is my comment.",
                                            job_id: "#{job.id}")

    expect(comment).to be_valid
  end
end
