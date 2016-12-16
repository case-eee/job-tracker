class DashboardController < ApplicationController

  def index
    @companies = Company.all
  end

end
