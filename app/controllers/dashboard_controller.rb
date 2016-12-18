class DashboardController < ApplicationController

  def index
    @payload = Job.payload
  end

end
