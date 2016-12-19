require "rails_helper"

describe "dashboard #index" do
  scenario "use should view jobs by interest" do
    @jobs = create_list(:job,5)
    visit(dashboard_index_path)

    Job.group_by_interest.each_pair do |(key,value)|
      expect(page).to have_content("Level of interest: #{key}")
      expect(page).to have_content("Number of jobs: #{value}")
    end
  end

end
