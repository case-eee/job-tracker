class DashboardController < ApplicationController

  def index
    @companies = Company.all
    @user = current_user
  end

end
