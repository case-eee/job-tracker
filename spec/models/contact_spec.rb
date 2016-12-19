require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a first name" do
        contact = Contact.new(last_name: "Dolan", position: "Director of Cats", email: "anna.dolan@gmail.com")
        expect(contact).to be_invalid
      end

      it "is invalid without a last name" do
        contact = Contact.new(first_name: "Anna", position: "Director of Cats", email: "anna.dolan@gmail.com")
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(first_name: "Anna", last_name: "Dolan", email: "anna.dolan@gmail.com")
        expect(contact).to be_invalid
      end

      it "is invalid without an email address" do
        contact = Contact.new(first_name: "Anna", last_name: "Dolan", position: "Director of Cats")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        contact = Contact.new(first_name: "Anna", last_name: "Dolan", position: "Director of Cats", email: "anna.dolan@gmail.com")
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(first_name: "Anna", last_name: "Dolan", position: "Director of Cats", email: "anna.dolan@gmail.com")
      expect(contact).to respond_to(:company)
    end
  end
end
