class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def dashboard
    @jobs = Job.all
    @jobs_by_location = Job.group(:city).count
    @jobs_by_interest = Job.group(:level_of_interest).count
    @companies_by_interest = {}
    Company.all.each do |company|
      @companies_by_interest[company.name] = company.jobs.average(:level_of_interest)
    end
  end
end
