require 'rails_helper'

RSpec.describe Category do
  describe "validations" do
    scenario "Cannot create new category without title" do
      category = Category.create()

      expect(category).to be_invalid
    end
    scenario "Cannot create new category if the title already exists" do
      Category.create(title: "Test Category")
      category = Category.create(title: "Test Category")

      expect(category).to be_invalid
    end
    scenario "Can create new category with unique title" do
      category = Category.create(title: "Test Category")

      expect(category).to be_valid
      expect(Category.count).to eq(1)
    end
  end

  describe "relationships" do
    it "has many jobs" do
      category = Category.new(title: "Programming")
      expect(category).to respond_to(:jobs)
    end
  end

end