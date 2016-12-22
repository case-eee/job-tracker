require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.new
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        comment = Comment.new(content: "My new comment!")
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(content: "My new comment!")
      expect(comment).to respond_to(:job)
    end
  end

  describe "comment ordering on page" do
    it "returns dates in reverse chronological order" do
      first = Comment.create(content: "1")
      second = Comment.create(content: "2")

      expect(Comment.reverse_chronological.first).to eq(second)
    end
  end
end