require 'rails_helper'

describe Comment do
  describe "validations" do
    context "is valid with content" do
      it {should validate_presence_of(:content)}
    end
  end

  describe "relationships" do
    context "has many jobs" do
      it {should belong_to(:job)}
    end
  end
end
