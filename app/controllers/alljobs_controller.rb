require 'page_setup'
require 'sort_definitions'
require 'tools'

class AlljobsController < ApplicationController

  include SortDefinitions
  include Tools

  def index
    @page_setup = PageSetup.new(:alljobs_index)
    if VALID_SORTS.include?(params[:sort])
      @jobs = Job.sort_all(SORT_EXPRESSIONS[params[:sort]])
    elsif params[:location]
      @jobs = Job.where(city: params[:location].capitalize).order("title ASC")
    else
      @jobs = Job.all
    end
    @level_of_interest_bar = loi_bar_details(@jobs)
  end

  def loi_bar_details(jobs) 
    max_level_of_interest = Job.maximum(:level_of_interest)
    level_of_interest_bar = init_hash(0)
    jobs.each do |job|
      level_of_interest_bar[job.level_of_interest] = "#{job.level_of_interest*100/max_level_of_interest}%"
    end
    return level_of_interest_bar
  end

end