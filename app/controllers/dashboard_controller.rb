class DashboardController < ApplicationController
  include ControllerHelper

  def index
    format_interest
    @low_interest = @interest_levels[:low]
    @medium_interest = @interest_levels[:medium]
    @high_interest = @interest_levels[:high]
    @interest_averages = format_interest_averages
    require 'pry'; binding.pry
  end

end