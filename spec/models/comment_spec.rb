require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.new()
        expect(comment).to be_invalid
      end

      it "has a unique title" do
        Comment.create(content: "Engineering")
        comment = Comment.new(content: "Engineering")
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        comment = Comment.new(content: "Engineering")
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to job" do
      comment = Comment.new(content: "Engineering")
      expect(comment).to respond_to(:jobs)
    end
  end
end
