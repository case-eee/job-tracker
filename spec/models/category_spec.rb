require 'rails_helper'

describe Category do
  describe "validations" do
    context "is valid with a title" do
      it {should validate_presence_of("title")}
    end

    context "the title must be unique" do
      it {should validate_uniqueness_of(:title)}
    end
  end

  describe "relationships" do
    context "has many jobs" do
      it {should have_many(:jobs)}
    end
  end
end
