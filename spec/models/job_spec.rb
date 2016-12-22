require 'rails_helper'

describe Job do
  describe "validations" do

    context "is valid with a title and level of interest" do
      it {should validate_presence_of(:title)}
      it {should validate_presence_of(:level_of_interest)}
    end
  end


  describe "relationships" do
    before {FactoryGirl.build_stubbed(:job)}

    context "belongs to a company" do
      it {should belong_to(:company)}
    end

    context "belongs to a category" do
      it {should belong_to(:category)}
    end

    context "belongs to a city" do
      it {should belong_to(:city)}
    end

    context "has many comments" do
      it {should have_many(:comments)}
    end
  end
end
