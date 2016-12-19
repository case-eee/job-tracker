require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe Contact do
   describe "validations" do

       it "is invalid without a any attributes" do
         contact = Contact.new()
         expect(contact).to be_invalid
       end

       it "is invalid without a name" do
         contact = Contact.new(position: "Hiring manager", email: "johmsmith@gmail.com")
         expect(contact).to be_invalid
       end

       it "is invalid without a position" do
         contact = Contact.new(full_name: "Jon", email: "johnsmith@gmail.com")
         expect(contact).to be_invalid
       end

       it "is invalid without an email" do
         contact = Contact.new(full_name: "Jon", position: "Hiring manager")
         expect(contact).to be_invalid
       end

     it "is valid with a name, position, email, and company" do
       company = Company.new(name: "Google")
       contact = Contact.create(full_name: "Jon", position: "Hiring manager", email: "johnsmith@gmail.com", company: company)
       expect(contact).to be_valid
     end
   end

   describe "relationships" do
     it "belongs to company" do
       company = Company.new(name: "Google")
       contact = Contact.new(full_name: "John Smith", position: "Hiring manager", email: "johnsmith@gmail.com", company: company)
       expect(contact).to respond_to(:company)
     end
   end
 end
 end
