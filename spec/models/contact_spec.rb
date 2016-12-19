require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full name" do
        contact = Contact.new(position: "Marketing Manager", email: "bjones@aviato.com")
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(full_name: "Bob Jones", email: "bjones@aviato.com")
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        contact = Contact.new(full_name: "Bob Jones", position: "Marketing Manager")
        expect(contact).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(full_name: "Bob Jones", position: "Marketing Manager", email: "bjones@aviato.com")
      expect(contact).to respond_to(:company)
    end
  end
end
