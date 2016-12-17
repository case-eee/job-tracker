require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        job = create(:job)
        comment = Comment.new(job: job)
        expect(comment).to be_invalid
      end

      it "is invalid without a job" do
        comment = Comment.new(content: "some content goes here")
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content and a job" do
        job = create(:job)
        comment = Comment.new(content: "some content goes here", job: job)
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do

    end
  end
end
