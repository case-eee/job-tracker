require "rails_helper"

describe Comment do
  describe "validations" do
    it "is valid with content" do

      comment = Comment.create(content: "sample")

      expect(comment).to be_valid
    end

  describe "relationships" do
    it "a comment belongs to a job" do
      job = Job.create(title: "LemonZester")
      comment = Comment.create(content: "sample", job_id: job.id)

      expect(comment.job_id).to eq(job.id)
      end
    end
  end
end
