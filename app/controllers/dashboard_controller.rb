class DashboardController < ApplicationController

  def index
    @payload = Job.payload
    @cities = @payload[:sort_by_city]
  end

end
