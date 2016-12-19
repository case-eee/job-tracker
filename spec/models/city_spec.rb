require 'rails_helper'

describe City do

  describe "validations" do

    context "the name must be present" do
      it {should validate_presence_of(:name)}
    end

    context "the name must be unique" do
      it {should validate_uniqueness_of(:name)}
    end

    context "the state must be unique" do
      it {should validate_uniqueness_of(:state)}
    end

    context "the state must be present" do
      it {should validate_presence_of(:state)}
    end
  end

  describe "relationships" do

    context "has many jobs" do
      it {should have_many(:jobs)}
    end
    
  end
end
