class DashboardController < ApplicationController

  def index
    @interested_jobs = Job.count_by_level_of_interest
  end

end
