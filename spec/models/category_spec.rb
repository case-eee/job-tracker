require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "has a unique title" do
        Category.create(title: "Dropbox")
        cateogry = Category.new(title: "Dropbox")
        expect(cateogry).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title" do
        cateogry = Category.new(title: "Dropbox")
        expect(cateogry).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      cateogry = Category.new(title: "Dropbox")
      expect(cateogry).to respond_to(:jobs)
    end
  end
end
