require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = create(:company)
        contact = Contact.new(position: "Student", email: "daniel123@somemail.com", company: company)
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        company = create(:company)
        contact = Contact.new(name: "Daniel", email: "daniel123@somemail.com", company: company)
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        company = create(:company)
        contact = Contact.new(name: "Daniel", position: "Student", company: company)
        expect(contact).to be_invalid
      end

      it "is invalid without a company" do
        contact = Contact.new(name: "Daniel", position: "Student", email: "daniel123@somemail.com")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        company = create(:company)
        contact = Contact.new(name: "Daniel", position: "Student", email: "daniel123@somemail.com", company: company)
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      company = create(:company)
      contact = create(:contact, company: company)
      expect(contact).to respond_to(:company)
    end
  end
end
