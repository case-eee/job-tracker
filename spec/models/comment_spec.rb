require 'rails_helper'

RSpec.describe Comment do
  describe "validations" do
    scenario "Cannot create new comment without content" do
      comment = Comment.create()

      expect(comment).to be_invalid
    end
    scenario "Cannot create new comment if content is empty string" do
      comment = Comment.create(content: "")

      expect(comment).to be_invalid
    end
    scenario "Can create new comment if enter any content" do
      comment = Comment.create(content: "Test comment")

      expect(comment).to be_valid
      expect(Comment.count).to eq(1)
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(content: "Wahooo")
      expect(comment).to respond_to(:job)
    end
  end
end