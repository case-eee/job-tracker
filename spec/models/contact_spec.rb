require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new(position: "Quarterback", email: "joe@example.com")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        contact = Contact.new(name: "Mike")
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(name: "Mike")
      expect(contact).to respond_to(:company)
    end
  end
end
