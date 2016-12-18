class DahsboardController < ApplicationController
  def index
    @count_by_interest = Job.count_by_interest
    @top_3 = Company.top_3_by_average_interest
    # @count_by_location = Company.job_count_by_location
  end
end
