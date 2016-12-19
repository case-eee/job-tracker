require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without title" do
        category = Category.new()
        expect(category).to be_invalid
      end

      context "valid attributes" do
        it "is valid with a name" do
          category = Category.new(title: "Web Developer")
          expect(category).to be_valid
        end
      end
    end

    describe "relationships" do
      it "has many jobs" do
        category = Category.new(title: "Web Developer")
        expect(category).to respond_to(:jobs)
      end
    end
  end
end
