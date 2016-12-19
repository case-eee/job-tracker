class DashboardController < ApplicationController
  def index
    @jobs = Job.group_by_interest
    @companies = Company.ranked_by_interest
    @cities = City.all
    render :index
  end

  def show
    @found_jobs = Job.find_jobs_by_interest
    render :show
  end
end
