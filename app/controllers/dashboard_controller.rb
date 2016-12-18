class DashboardController < ApplicationController
  include DashboardHelper
  before_action :format_interest

  def index
    @low_interest      = @interest_levels[:low]
    @medium_interest   = @interest_levels[:medium]
    @high_interest     = @interest_levels[:high]
    @interest_averages = format_interest_averages
    @city_counts       = organize_jobs_by_city
    @companies         = Company.all
  end

end