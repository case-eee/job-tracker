require 'rails_helper'


describe Contact do
  describe 'validations' do
    context "invalid contacts" do
      before :each do
        @company  = Company.create(name: "Best Buy")
      end
      it "is invalid without a name" do
        contact = @company.contacts.create(position: 'person', email: 'a@email')

        expect(contact).to be_invalid
      end
      it "is invalid without a position" do
        contact = @company.contacts.create(name: 'person', email: 'a@email')

        expect(contact).to be_invalid
      end
      it "is invalid without an email" do
        contact = @company.contacts.create(name: 'person', position: 'fighter')

        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name, position, and email" do
        company = Company.create(name: 'Best Buy')
        contact = company.contacts.create(name: 'person', position: 'fighter', email: 'email@email.com')

        expect(contact).to be_valid
      end
    end
  end

  describe "realtionships" do
    it "belongs to a company" do
      contact = Contact.new(name: 'Gandalf', position: 'Wizard', email: 'wizzyman@gmail.com')

      expect(contact).to respond_to(:company)
    end
  end
end
