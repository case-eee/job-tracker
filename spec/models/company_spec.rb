require 'rails_helper'

describe Company do
  describe "validations" do
    context "it must have a unique name" do
      it {should validate_uniqueness_of(:name)}
    end

    context "valid attributes" do
      it {should validate_presence_of(:name)}
    end
  end

  describe "relationships" do
    context "has many jobs" do
      it {should have_many(:jobs)}
    end

    context "has many contacts" do
      it {should have_many(:contacts)}
    end

  end
end
