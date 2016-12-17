class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
  def by_location?(sort)
    if sort.eql? "location"
      @company.jobs.order(:city)
    else
      @company.jobs
    end
  end
end
