class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
  def sort_by(attribute)
    if attribute.eql? "location"
      @company.jobs.order(:city)
    elsif attribute.eql? "interest"
      @company.jobs.order('level_of_interest DESC')
    else
      @company.jobs
    end
  end

  def filter_by(location)
    Job.where(city: location)
  end
end
