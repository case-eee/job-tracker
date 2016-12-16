require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new()
        expect(category).to be_invalid
      end

      it "has a unique title" do
        Category.create(title: "Web Development")
        category = Category.new(title: "Web Development")
        expect(category).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      category = Category.new(title: "Web Development")
      expect(category).to respond_to(:jobs)
    end
  end
end
