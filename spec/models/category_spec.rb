require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "relationships" do
    it "has many jobs" do
      category = Category.new(name: "Education")
      expect(category).to respond_to(:jobs)
    end
  end
end
