require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "isnt valid without content" do
        comment = Comment.new(job_id: 1)
        expect(comment).to be_invalid
      end

      it "is invalid without a job id" do
        comment = Comment.new(content: "Test")
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        comment = Comment.new(content: "Test", job_id: 1)

        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(content: "Test", job_id: 1)
      expect(comment).to respond_to(:job)
    end
  end
end