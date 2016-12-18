require 'rails_helper'

describe Comment do
  describe 'validations' do
    context "invalid comments" do
      before :each do
        company  = Company.create(name: "Best Buy")
        category = Category.create(name: 'Technology')
        @job     = company.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id)
      end
      it "is invalid without an author" do
        comment = @job.comments.create(content: "test content")

        expect(comment).to be_invalid
      end

      it "is invalid without content" do
        comment = @job.comments.create(author: "Drew")

        expect(comment).to be_invalid
      end

      it "is invalid without a job" do
        comment = Comment.create(author: "Drew", content: "blah")

        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with an author, content, and job_id" do
        company  = Company.create(name: "Best Buy")
        category = Category.create(name: 'Technology')
        @job     = company.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id)
        comment = Comment.create(author: "Bilbo", content: "test content", job_id: @job.id)

        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(author: "Bilbo", content: "My precious")

      expect(comment).to respond_to(:job)
    end
  end
end
