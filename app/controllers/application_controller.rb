class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
  def sort_by(attribute, list)
    if attribute.eql? "location"
      list.order(:city)
    elsif attribute.eql? "interest"
      list.order('level_of_interest DESC')
    elsif attribute.eql? "company"
      list.order(:company_id)
    else
      list
    end
  end

  def filter_by(location)
    Job.where(city: location)
  end
end
