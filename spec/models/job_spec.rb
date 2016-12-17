require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = create(:job)
        job.title = nil
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = create(:job)
        job.level_of_interest = nil
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = create(:job)
        job.city = nil
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        job = create(:job)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = create(:job)
      expect(job).to respond_to(:company)
    end
  end
end
