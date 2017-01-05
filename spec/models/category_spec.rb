require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new()
        expect(category).to be_invalid
      end

      it "has a unique title" do
        category1 = Category.create(title: "Development")
        category2 = Category.create(title: "Development")

        expect(category2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a unique title" do
        category1 = Category.create(title: "Development")
        category2 = Category.create(title: "Janitorial")

        expect(category1).to be_valid
        expect(category2).to be_valid
      end
    end
  end
end