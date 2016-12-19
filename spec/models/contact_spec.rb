require 'rails_helper'

RSpec.describe Contact do
  describe "validations" do
    scenario "Cannot create new contact without any details" do
      contact = Contact.create()

      expect(contact).to be_invalid
    end
    scenario "Cannot create new contact if name is empty" do
      contact = Contact.create(name: "", position: "Boss", email: "boss@who.com")

      expect(contact).to be_invalid
    end
    scenario "Cannot create new contact if position is empty" do
      contact = Contact.create(name: "Dr Who", position: "", email: "boss@who.com")

      expect(contact).to be_invalid
    end
    scenario "Cannot create new contact if email is empty string" do
      contact = Contact.create(name: "Dr Who", position: "Boss", email: "")

      expect(contact).to be_invalid
    end
    scenario "Can create new contact if enter any content" do
      contact = Contact.create(name: "Dr Who", position: "Boss", email: "boss@who.com")

      expect(contact).to be_valid
      expect(Contact.count).to eq(1)
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(name: "Dr Who", position: "Boss", email: "boss@who.com")
      expect(contact).to respond_to(:company)
    end
  end
end