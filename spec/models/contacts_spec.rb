require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a comment" do
        contact = Contact.new()
        expect(contact).to be_invalid
      end
    end

    context "invalid attributes" do
      it "is invalid with just a name" do
        contact = Contact.new(name: "Devin")
        expect(contact).to be_invalid
      end
    end

    context "invalid attributes" do
      it "is invalid with just a position" do
        contact = Contact.new(position: "Manager")
        expect(contact).to be_invalid
      end
    end

    context "invalid attributes" do
      it "is invalid with just an email" do
        contact = Contact.new(email: "test@test.com")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with name, position, and email" do
        contact = Contact.new(name: "Drew",
                              position: "Dude that works there",
                              email: "whats_an@email.com")
        expect(contact).to be_valid                              
      end
    end
  end

  describe "relationships" do
    it "belongs to company" do
      contact = Contact.new(name: "Drew",
                            position: "Dude that works there",
                            email: "whats_an@email.com")
      expect(contact).to respond_to(:company)
    end
  end
end