require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full name" do
        contact = Contact.new(position: "Janitor", email: "ebennett19@chipotle.biz", company_id: 1)

        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(full_name: "Ethan Bennett", email: "ebennett19@chipotle.biz", company_id: 1)

        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        contact = Contact.new(full_name: "Ethan Bennett", position: "Janitor", company_id: 1)

        expect(contact).to be_invalid
      end

      it "is invalid without a company" do
        contact = Contact.new(full_name: "Ethan Bennett", position: "Janitor", email: "ebennett19@chipotle.biz")

        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        contact = Contact.new(full_name: "Ethan Bennett", position: "Janitor", email: "ebennett19@chipotle.biz", company_id: 1)

        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(full_name: "Ethan Bennett", position: "Janitor", email: "ebennett19@chipotle.biz", company_id: 1)

      expect(contact).to respond_to(:company)
    end
  end
end