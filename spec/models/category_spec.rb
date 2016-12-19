require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid whithout a title" do
        category = Category.new()
        expect(category).to be_invalid
      end
    end
  end
end
