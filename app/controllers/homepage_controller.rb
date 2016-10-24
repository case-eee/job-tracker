class HomepageController < ApplicationController
  include HomepageHelper
  def index
    @companies = Company.all
    @categories = Category.all
    breakdown_jobs_by_level_of_interest
    display_top_three
    breakdowns_jobs_by_location
  end
end
