require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid contact" do
      it "is invalid without a any attributes" do
        contact = Contact.new()
        expect(contact).to be_invalid
      end

      it "is invalid without a name" do
        contact = Contact.new(position: "Hiring manager")
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(name: "Jon")
        expect(contact).to be_invalid
      end  
    end
  end
end
