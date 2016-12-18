class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def dashboard
    @job_count_by_location = Job.count_by_location
    @job_count_by_interest = Job.count_by_level_of_interest
    @top_companies = Company.top_companies(3)

    render "shared/dashboard"
  end

end
