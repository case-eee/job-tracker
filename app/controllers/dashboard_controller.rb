class DashboardController < ApplicationController

  def index
    @jobs = Job.all
    @companies = Company.all
    @count_by_interest = Job.count_by_interest
    @top_3_by_average_interest = Company.top_3_by_average_interest
  end

end
