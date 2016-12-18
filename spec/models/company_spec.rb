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
    company = create(:company_with_jobs)
    expect(Job.count).to eql(3)

    company.destroy
    expect(Job.count).to eql(0)
  end

end
