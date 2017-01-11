require 'rails_helper'

describe Category do
  describe "validations" do
    it "is is invalid without a title" do
    category = Category.create()

    expect(category).to be_invalid
    end
  end
end
