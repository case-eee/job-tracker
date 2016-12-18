require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(author: "me", body: "hello")
      expect(comment).to respond_to(:job)
    end
  end

  context "valid attributes" do
    it "is valid with an author and a body" do
      comment = Comment.create(author: "me", body: "hello")
      expect(comment).to be_valid
    end

    it "is invalid without an author" do
      comment = Comment.create(body: "hello")
      expect(comment).to be_invalid
    end

    it "is invalid without a body" do
      comment = Comment.create(author: "me")
      expect(comment).to be_invalid
    end
  end

end
