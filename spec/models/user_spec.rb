require "rails_helper"

describe User do
  describe "validations" do
    context "is valid with a password and user name" do
      it {should validate_presence_of(:user_name)}
      it {should validate_presence_of(:password)}
    end

    context "the user name must be unique" do
      it {should validate_uniqueness_of(:user_name)}
    end
  end

  describe "relationships" do
    context "has many jobs" do
      it {should have_many(:jobs)}
    end
  end
end
