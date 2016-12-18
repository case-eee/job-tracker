class DashboardController < ApplicationController
  include ControllerHelper

  def index
    format_interest
    require 'pry'; binding.pry
  end

end