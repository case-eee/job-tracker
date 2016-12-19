require 'rails_helper'

describe Company do
  describe "validations" do
    context "it must have a unique name" do
      it {should validate_uniqueness_of(:name)}
    end

    context "valid attributes" do
      it {should validate_presence_of(:name)}
    end
  end

  describe "relationships" do
    context "has many jobs" do
      it {should have_many(:jobs)}
    end

    context "has many contacts" do
      it {should have_many(:contacts)}
    end
  end

  describe "#methods" do
    before do
      FactoryGirl.reload
      create(:company_jobs)
    end

    it "average interest" do
      Company.all.each do |company|
        expect(company.average_interest).to be_a(Fixnum)
      end
    end

    it "ranked_by_interest" do
      expected = Company.ranked_by_interest

      expect(expected.count).to eq(3)
      expect(expected.first.average_interest).to be >= expected[1].average_interest
      expect(expected.first.average_interest).to be >= expected.last.average_interest
    end

  end
end
