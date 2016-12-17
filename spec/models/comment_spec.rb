require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        invalid_comment = Comment.new()

        expect(invalid_comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        valid_comment = Comment.new(content: "Hello, world")

        expect(valid_comment).to be_valid
      end
    end

    context "relationships" do
      it "belongs to a job" do
        comment = Comment.new(content: "Hello, world")

        expect(comment).to respond_to(:job)
      end
    end
  end
end