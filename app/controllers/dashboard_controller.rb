require_relative '../helpers/company_helper'

class DashboardController < ApplicationController

  def index
    @jobs = Job.job_count
    @companies = Company.top_three_interests
    @locations = Company.location_count

    render :index
  end

  def redirect
    if Company.find_by(name: params["search-id"]).nil?
      @message = "#{params["search-id"]} does not exist"
      render :error
    else
      company = Company.find_by(name: params["search-id"])
      redirect_to company_path(company)
    end
  end

end
