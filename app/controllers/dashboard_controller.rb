class DashboardController < ApplicationController
  def index
    @job     = Job.level_of_interest
    @company = Company.top_three_companies_by_level_of_interest
  end
end
