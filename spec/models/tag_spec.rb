require 'rails_helper'

describe Tag do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without title" do
        tag = Tag.new()
        expect(tag).to be_invalid
      end

      it "has a unique title" do
        Tag.create(title: "Test")
        tag = Tag.new(title: "Test")
        expect(tag).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        tag = Tag.new(title: "This is a test")
        expect(tag).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job_tags" do
      tag = Tag.new(title: "Test")
      expect(tag).to respond_to(:jobs_tags)
    end
  end
end
