require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new(position: "Product manager", email: "ericcson@gmail.com")
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(name: "Ericsson", email: "ericcson@gmail.com")
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        contact = Contact.new(name: "Ericsson", position: "Product manager")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name, position and email" do
        contact = Contact.new(name: "Ericsson", position: "Product manager", email: "ericcson@gmail.com")
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(name: "Ericsson", position: "Product manager", email: "ericcson@gmail.com")
      expect(contact).to respond_to(:company)
    end
  end
end
