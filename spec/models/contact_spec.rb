require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full name" do
        contact = Contact.new(position: "Manager", email: "test@test.com")
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(full_name: "Man Ager", email: "test@test.com")
        expect(contact).to be_invalid
      end

      it "is invalid without a email" do
        contact = Contact.new(full_name: "Man Ager", position: "Manager")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name and city" do
        contact = Contact.new(full_name: "Man Ager", position: "Manager", email: "test@test.com")
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = create(:contact)
      expect(contact).to respond_to(:company)
    end
  end
end
