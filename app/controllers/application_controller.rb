class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
  def sorter(sort)
    if sort.eql? "location"
      @company.jobs.order(:city)
    elsif sort.eql? "interest"
      @company.jobs.order(:level_of_interest).reverse
    else
      @company.jobs
    end
  end
end
