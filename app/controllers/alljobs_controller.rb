require 'page_setup'
require 'sort_definitions'

class AlljobsController < ApplicationController

  include SortDefinitions
  # VALID_SORT = ["location", "interest"]

  def index
    @page_setup = PageSetup.new(:alljobs_index)
    @max_level_of_interest = Job.maximum(:level_of_interest)
    if VALID_SORT.include?(params[:sort])
      @jobs = Job.all.order("city ASC") if params[:sort] == "location"
      @jobs = Job.all.order("level_of_interest DESC") if params[:sort] == "interest"
    elsif params[:location]
      location = params[:location]
      @jobs = Job.where(city: [location, location.upcase, location.downcase, location.capitalize])
    else
      @jobs = Job.all
    end
    @level_of_interest_bar = init_hash(0)
    @jobs.each do |job|
      @level_of_interest_bar[job.level_of_interest] = "#{job.level_of_interest*100/@max_level_of_interest}%"
    end
  end


  def init_hash(value)
    Hash.new(value)
  end
end