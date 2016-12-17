class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
  def sorter(order_by)
    if order_by.eql? "location"
      @company.jobs.order(:city)
    elsif order_by.eql? "interest"
      @company.jobs.order('level_of_interest DESC')
    else
      @company.jobs
    end
  end
end
