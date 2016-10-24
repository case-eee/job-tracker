require 'rails_helper'

describe Comment do
  describe "validations" do
      it "is invalid without content" do
        comment = Comment.new
        expect(comment).to be_invalid
      end

      it "is valid with content" do
        comment = Comment.new(content: "great content")
        expect(comment).to be_valid
      end
    end

  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(content: "great content")
      expect(comment).to respond_to(:job)
    end
  end
end
