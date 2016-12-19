require 'rails_helper'

RSpec.describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full_name" do
        contact = Contact.new(position: "Teacher",
                              email: "johnson123@123.com",
                              company_id: 1
                             )
        expect(contact).to be_invalid
      end

      it "has a unique name" do
        Contact.create(full_name: "Mark Johnson",
                       position: "Teacher",
                       email: "johnson123@123.com",
                      company_id: 1
                      )
        contact = Contact.new(full_name: "Mark Johnson",
                              position: "Teacher",
                              email: "johnson123@123.com",
                              company_id: 1
                             )
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(full_name: "Mark Johnson",
                              email: "johnson123@123.com",
                              company_id: 1
                             )
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        contact = Contact.new(full_name: "Mark Johnson",
                              position: "Teacher",
                              company_id: 1
                             )
        expect(contact).to be_invalid
      end

      it "is invalid without a company_id" do
        contact = Contact.new(full_name: "Mark Johnson",
                              position: "Teacher",
                              email: "johnson123@123.com"
                             )
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        contact = Contact.new(full_name: "Mark Johnson",
                              position: "Teacher",
                              email: "johnson123@123.com",
                              company_id: 1
                             )
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company"  do
      contact = Contact.new()
      expect(contact).to respond_to(:company)
    end
  end
end
