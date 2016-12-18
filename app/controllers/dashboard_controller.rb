class DashboardController < ApplicationController

  def index
    @companies = Company.all
    # @jobs = @company.jobs
  end

end
