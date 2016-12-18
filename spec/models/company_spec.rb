require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end

    it "has many contacts" do
      company = create(:company)
      expect(company).to respond_to(:contacts)
    end

    it "associated jobs are destroyed" do
      company = create(:company)
      job = create(:job, company: company)

      expect {company.destroy}.to change {Job.count}.by(-1)
    end

    it "associated contacts are destroye" do
      company = create(:company)
      contact = create(:contact, company: company)

      expect {company.destroy}.to change {Contact.count}.by(-1)
    end
  end

  describe "instance methods" do
    it "returns average interest level" do
      company = create(:company)
      create_list(:job, 3, level_of_interest: 50)
      create(:job, level_of_interest: 25, company: company)
      create_list(:job, 2, level_of_interest: 10, company: company)

      expect(company.average_interest).to eq 15
    end
  end
end
