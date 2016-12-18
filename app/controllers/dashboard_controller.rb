require 'db_job'
require 'page_setup'

class DashboardController < ApplicationController
  def index
    @page_setup = PageSetup.new(:dashboard_index)
    @level_of_interest_counts = Job.all.order("level_of_interest DESC").group(:level_of_interest).count
    @city_counts = Job.all.order("city ASC").group(:city).count
    @companies_by_avg_loi = Company.joins(:jobs).group(:name).order("average_level_of_interest DESC").limit(3).average(:level_of_interest)
    # @message = DbJob.new
  end

end