require 'rails_helper'

describe Contact do
  describe "validations" do
    context "is valid with a title" do
      it {should validate_presence_of("name")}
    end

    context "is valid with a position" do
      it {should validate_presence_of("position")}
    end
    context "is valid with a email" do
      it {should validate_presence_of("email")}
    end

    context "the email must be unique" do
      it {should validate_uniqueness_of(:email)}
    end
  end

  describe "relationships" do
    context "belongs to a company" do
      it {should belong_to(:company)}
    end
  end
end
