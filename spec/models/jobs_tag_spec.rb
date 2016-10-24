require 'rails_helper'

describe JobsTag do
  describe "relationships" do
    it "belongs to a job" do
      jobtag = JobsTag.new(job_id: 1, tag_id: 1)
      expect(jobtag).to respond_to(:job)
    end

    it "belongs to a tag" do
      jobtag = JobsTag.new(job_id: 1, tag_id: 1)
      expect(jobtag).to respond_to(:tag)
    end
  end
end
