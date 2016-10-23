require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.new()
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        comment = Comment.new(content: "This is a test")
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(content: "Test")
      expect(comment).to respond_to(:job)
    end
  end
end
