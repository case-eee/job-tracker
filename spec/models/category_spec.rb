require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "relationships" do
    it "has many jobs" do
      category = Category.new(name: "Education")
      expect(category).to respond_to(:jobs)
    end
  end

  describe "validations" do
    it "has a unique name" do
      Category.create(name: "Technology")
      category = Category.new(name: "Technology")
      expect(category).to be_invalid
    end

    context "invalid attributes" do
      it "is invalid without a name" do
        category = Category.new()
        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        category = Category.new(name: "Technology")
        expect(category).to be_valid
      end
    end
  end
end
