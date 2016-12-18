class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def dashboard
    @job_count_by_location = Job.count_by_location

    

    render "shared/dashboard"
  end
end
