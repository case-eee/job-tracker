require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full_name" do
        contact = Contact.new(email: "whoop@gmail.com", company_id: 1, position: "Her Majesty the CEO")
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        contact = Contact.new(full_name: "Mrs. Hiring Manager", company_id: 2, position: "Hiring Manager")
        expect(contact).to be_invalid
      end

      it "is invalid without a company_id" do
        contact = Contact.new(full_name: "George Clooney", email: "hothot@gmail.com", position: "Director")
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(full_name: "Joe Bob", email: "name@example.com", company_id: 5)
        expect(contact).to be_invalid
      end

      context "valid attributes" do
        it "is valid with a full name, email, position, and company" do
          contact = Contact.new(full_name: "Dr. Jane Doe", email: "herworshipfulness@yahoo.com", position: "Ruler of Rules", company_id: 1)
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
end