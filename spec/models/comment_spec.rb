require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.new(job_id: 2)
        expect(comment).to be_invalid
      end

    context "invalid attributes" do
      it "is invalid without job_id" do
        comment = Comment.new(content: "This is a test")
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        comment = Comment.new(content: "This is a test",
                              job_id: 2
                             )
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company"  do
      comment = Comment.new()
      expect(comment).to respond_to(:job)
    end
  end
  end
end
