require 'rails_helper'

describe "Job" do
  context "#groups" do
    scenario "by location" do
      job = create(:job)
      expected = ["Location", {job.city => [job]}]

      expect(Job.groups("location")).to eq expected
    end

    scenario "by level of interest" do
      job = create_list(:job, 3)
      expected = ["Level of Interest",
      Job.all.group_by {|job| job.level_of_interest}.sort.reverse]

      expect(Job.groups("interest")).to eq expected
    end

    scenario "with no jobs" do

      expect(Job.groups("location")).to eq ["Location", {}]
    end
  end

  context "#location" do
    scenario "with jobs" do
      job = create(:job)

      expect(Job.location(job.city)).to eq [job]
    end

    scenario "with no jobs" do
      expected = []

      expect(Job.location("Denver")).to eq expected
    end
  end

  context "#count_by_location" do
    scenario "with jobs" do
      job = create(:job)
      expected = {job.city => 1}

      expect(Job.count_by_location).to eq expected
    end

    scenario "with no jobs" do
      expected = {}

      expect(Job.count_by_location).to eq expected
    end
  end

  context "#count_by_level_of_interest" do
    scenario "with jobs" do
      job = create(:job)
      expected = {job.level_of_interest => 1}

      expect(Job.count_by_level_of_interest).to eq expected
    end

    scenario "with no jobs" do
      expected = {}

      expect(Job.count_by_level_of_interest).to eq expected
    end
  end
end