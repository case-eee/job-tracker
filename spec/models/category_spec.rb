require 'rails_helper'

describe Category do
  describe "validations" do
      it "is invalid without title" do
        category = Category.new
        expect(category).to be_invalid
      end

      it "is valid with title" do
        category = Category.new(title: "technical")
        expect(category).to be_valid
      end

      it "has a unique title" do
        Category.create(title: "technical")
        category = Category.new(title: "technical")
        expect(category).to be_invalid
      end
    end

  describe "relationships" do
    it "has many jobs" do
      category = Category.new(title: "technical")
      expect(category).to respond_to(:jobs)
    end
  end
end
