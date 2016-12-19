require 'page_setup'

class DashboardController < ApplicationController
  def index
    @page_setup = PageSetup.new(:dashboard_index)
    @level_of_interest_counts = Job.count_per_level_of_interest
    @cities = Job.count_per_cities
    @top_companies_by_avg_loi = Company.top_companies_by_average_level_of_interest
  end
end